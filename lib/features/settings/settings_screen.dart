import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/widgets/common.dart';
import '../onboarding/onboarding_screens.dart';
import '../plan_engine/plan_generator.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
        title: 'Settings',
        child: Column(children: [
          ModuleTile(icon: Icons.favorite_outline, title: 'Wedding details', subtitle: 'Edit date, city, guests and budget', onTap: () => context.go('/settings/wedding')),
          const SizedBox(height: 10),
          ModuleTile(icon: Icons.event_available_outlined, title: 'Review events', subtitle: 'Add events or archive ones you no longer need', onTap: () => context.go('/settings/events')),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: WedlyColors.sage, child: Icon(Icons.lock_outline, color: WedlyColors.plum)),
              title: const Text('Privacy & about'),
              subtitle: const Text('How Wedly stores your information'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Wedly',
                applicationVersion: '1.0',
                children: const [
                  Text('Wedly stores your wedding plan locally on this device. The app does not use accounts, analytics, location, ads, or network services. You can delete all saved wedding data from Settings at any time.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red.shade800),
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete all my data?'),
                        content: const Text('This permanently removes your wedding, plan, guest list and every saved item from this device. This cannot be undone.'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete all data')),
                        ],
                      ),
                    ) ??
                    false;
                if (!confirmed) return;
                await ref.read(repositoryProvider).deleteAllData();
                if (context.mounted) context.go('/welcome');
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete all my data'),
            ),
          ),
        ]),
      );
}

class EditEventsScreen extends ConsumerStatefulWidget {
  const EditEventsScreen({super.key});
  @override
  ConsumerState<EditEventsScreen> createState() => _EditEventsScreenState();
}

class _EditEventsScreenState extends ConsumerState<EditEventsScreen> {
  Wedding? _wedding;
  List<Event> _events = [];
  final Set<String> _selectedKeys = {};
  final Map<String, String> _custom = {};
  final Map<int, bool> _archiveChoice = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(repositoryProvider);
    final wedding = await repo.getWedding();
    if (wedding == null) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    final events = await repo.watchEvents(wedding.id).first;
    if (!mounted) return;
    setState(() {
      _wedding = wedding;
      _events = events;
      for (final event in events) {
        if (event.templateKey != null) _selectedKeys.add(event.templateKey!);
        _archiveChoice[event.id] = false;
      }
      _loading = false;
    });
  }

  Future<void> _addCustom() async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a custom event'),
        content: TextField(controller: controller, decoration: const InputDecoration(labelText: 'Event name')),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')), FilledButton(onPressed: () => Navigator.pop(context, controller.text.trim()), child: const Text('Add'))],
      ),
    );
    controller.dispose();
    if (name == null || name.isEmpty) return;
    if (_events.any((e) => e.name.toLowerCase() == name.toLowerCase()) || _custom.values.any((e) => e.toLowerCase() == name.toLowerCase())) {
      showMessage(context, 'Enter an event name that is not already listed.');
      return;
    }
    final key = 'custom_${name.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_|_$'), '')}';
    setState(() { _custom[key] = name; _selectedKeys.add(key); });
  }

  Future<void> _save() async {
    final wedding = _wedding;
    if (wedding == null) return;
    if (_selectedKeys.isEmpty && _events.where((e) => !_archiveChoice[e.id]!).isEmpty) {
      showMessage(context, 'Select at least one event.');
      return;
    }
    final activeKeys = _events.map((e) => e.templateKey).whereType<String>().toSet();
    final added = _selectedKeys.difference(activeKeys).toList();
    final removed = _events.where((e) => e.templateKey != null && !_selectedKeys.contains(e.templateKey)).toList();
    if (added.isNotEmpty || removed.isNotEmpty) {
      final accepted = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Review your plan changes'),
              content: const Text('Your event selection has changed. Review your generated plan before applying new event items. New events can receive their template items. Removed events can stay in the plan or be archived. Nothing will be deleted.'),
              actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')), FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Review Changes'))],
            ),
          ) ??
          false;
      if (!accepted) return;
      final repo = ref.read(repositoryProvider);
      for (final event in removed) {
        final archive = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Keep ${event.name}?'),
                content: const Text('Keep this event in your plan, or archive it and hide it from the event list. Its saved items will not be deleted.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Keep event')),
                  FilledButton.tonal(onPressed: () => Navigator.pop(context, true), child: const Text('Archive event')),
                ],
              ),
            ) ??
            false;
        if (archive) await repo.archiveEvent(event.id, true);
      }
      if (added.isNotEmpty) {
        try {
          await PlanGenerator(ref.read(databaseProvider)).generate(
            wedding: wedding,
            eventKeys: added,
            customEvents: _custom,
          );
        } catch (_) {
          if (mounted) showMessage(context, 'Something went wrong. Your wedding details are saved. Please try again.');
          return;
        }
      }
    }
    if (mounted) {
      context.go('/plan');
      showMessage(context, 'Event selection updated.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (_wedding == null) return PageFrame(title: 'Review events', child: const Text('No wedding yet.'));
    return PageFrame(
      title: 'Review events',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Select events to add to your plan. Unselected events are reviewed before they are archived.', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 18),
        for (final entry in eventOptions.entries)
          CheckboxListTile(
            value: _selectedKeys.contains(entry.key),
            title: Text(entry.value),
            onChanged: (value) => setState(() => value == true ? _selectedKeys.add(entry.key) : _selectedKeys.remove(entry.key)),
          ),
        for (final entry in _custom.entries)
          CheckboxListTile(value: _selectedKeys.contains(entry.key), title: Text(entry.value), onChanged: (value) => setState(() => value == true ? _selectedKeys.add(entry.key) : _selectedKeys.remove(entry.key))),
        OutlinedButton.icon(onPressed: _addCustom, icon: const Icon(Icons.add), label: const Text('Custom Event')),
        const SizedBox(height: 22),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: _save, child: const Text('Review changes'))),
      ]),
    );
  }
}
