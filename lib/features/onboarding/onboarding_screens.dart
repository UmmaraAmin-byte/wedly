import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/common.dart';
import '../plan_engine/plan_generator.dart';

const eventOptions = <String, String>{
  'mehndi': 'Mehndi',
  'sangeet': 'Sangeet',
  'haldi': 'Haldi',
  'nikah': 'Nikah',
  'barat': 'Barat',
  'walima': 'Walima',
  'rehearsal_dinner': 'Rehearsal Dinner',
  'ceremony': 'Ceremony',
  'reception': 'Reception',
};

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StreamBuilder<Wedding?>(
    stream: ref.watch(repositoryProvider).watchWedding(),
    builder: (context, snapshot) {
      if (!snapshot.hasData && !snapshot.hasError) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        if (snapshot.data != null) {
          context.go('/home');
        } else {
          context.go('/welcome');
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    },
  );
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 285,
                  decoration: const BoxDecoration(
                    color: WedlyColors.blush,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(140),
                      bottom: Radius.circular(36),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.spa_outlined,
                        size: 46,
                        color: WedlyColors.rose,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'wedly',
                        style: TextStyle(
                          fontFamily: 'CormorantGaramond',
                          fontSize: 52,
                          fontWeight: FontWeight.w700,
                          color: WedlyColors.plum,
                        ),
                      ),
                      Text(
                        'YOUR DAY, BEAUTIFULLY PLANNED',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          color: WedlyColors.rose,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                Text(
                  'Your wedding plan, generated in minutes.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Share your events, guest count, city and budget. Wedly builds lists you can edit, assign and track.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: () => context.go('/setup'),
                    child: const Text('Create My Wedding'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Private by design · Your plan stays on this device',
                  style: TextStyle(color: WedlyColors.muted, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class WeddingSetupScreen extends ConsumerStatefulWidget {
  const WeddingSetupScreen({super.key, this.isEditing = false});
  final bool isEditing;
  @override
  ConsumerState<WeddingSetupScreen> createState() => _WeddingSetupScreenState();
}

class _WeddingSetupScreenState extends ConsumerState<WeddingSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _guests = TextEditingController();
  final _budget = TextEditingController();
  DateTime? _date;
  String _city = 'Islamabad';
  Wedding? _wedding;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (widget.isEditing) {
      final wedding = await ref.read(repositoryProvider).getWedding();
      if (!mounted) return;
      _wedding = wedding;
      if (wedding != null) {
        _name.text = wedding.name;
        _date = wedding.weddingDate;
        _city = wedding.city;
        _guests.text = '${wedding.guestCount}';
        _budget.text = '${wedding.totalBudget}';
      }
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _name.dispose();
    _guests.dispose();
    _budget.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    if (!_formKey.currentState!.validate()) return;
    final dateError = validateWeddingDate(_date);
    if (dateError != null) {
      showMessage(context, dateError);
      return;
    }
    if (_city != 'Islamabad' && _city != 'Rawalpindi') {
      await ref.read(repositoryProvider).addWaitlistInterest(_city);
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Coming soon'),
            content: Text(
              'Wedly is not available in $_city yet. We’ve saved your interest.',
            ),
            actions: [
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Got it'),
              ),
            ],
          ),
        );
      }
      return;
    }
    final repository = ref.read(repositoryProvider);
    await repository.saveWedding(
      id: _wedding?.id,
      name: _name.text,
      date: _date!,
      city: _city,
      guests: int.parse(_guests.text),
      budget: int.parse(_budget.text),
    );
    if (!mounted) return;
    if (widget.isEditing) {
      context.go('/home');
      showMessage(context, 'Wedding details updated.');
    } else {
      context.go('/select-events');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return PageFrame(
      title: widget.isEditing ? 'Wedding details' : 'Create your wedding',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isEditing
                  ? 'Keep the important details up to date.'
                  : 'A few details help Wedly shape your plan.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 22),
            TextFormField(
              controller: _name,
              validator: validateWeddingName,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Wedding name'),
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate:
                      _date ?? DateTime.now().add(const Duration(days: 180)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                );
                if (picked != null) setState(() => _date = picked);
              },
              borderRadius: BorderRadius.circular(16),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Wedding date',
                  errorText: _date == null ? null : null,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: WedlyColors.rose,
                    ),
                    const SizedBox(width: 10),
                    Text(_date == null ? 'Choose a date' : formatDate(_date!)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              value: _city,
              decoration: const InputDecoration(labelText: 'City'),
              items: const [
                DropdownMenuItem(value: 'Islamabad', child: Text('Islamabad')),
                DropdownMenuItem(
                  value: 'Rawalpindi',
                  child: Text('Rawalpindi'),
                ),
                DropdownMenuItem(
                  value: 'Lahore',
                  child: Text('Lahore · Coming soon'),
                ),
                DropdownMenuItem(
                  value: 'Karachi',
                  child: Text('Karachi · Coming soon'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other city · Coming soon'),
                ),
              ],
              onChanged: (value) =>
                  setState(() => _city = value ?? 'Islamabad'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _guests,
              validator: validateGuestCount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Guest count',
                prefixIcon: Icon(Icons.people_outline),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _budget,
              validator: validateBudget,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Approximate budget',
                prefixText: 'PKR ',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: _continue,
                child: Text(widget.isEditing ? 'Save changes' : 'Continue'),
              ),
            ),
            if (!widget.isEditing) ...[
              const SizedBox(height: 12),
              const Text(
                'Only Islamabad and Rawalpindi are currently available.',
                style: TextStyle(color: WedlyColors.muted),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SelectEventsScreen extends ConsumerStatefulWidget {
  const SelectEventsScreen({super.key});
  @override
  ConsumerState<SelectEventsScreen> createState() => _SelectEventsScreenState();
}

class _SelectEventsScreenState extends ConsumerState<SelectEventsScreen> {
  final Set<String> _selected = {};
  final Map<String, String> _custom = {};
  bool _generating = false;
  Wedding? _wedding;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    ref.read(repositoryProvider).getWedding().then((wedding) {
      if (mounted) {
        setState(() {
          _wedding = wedding;
          _checking = false;
        });
      }
    });
  }

  Future<void> _addCustomEvent() async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a custom event'),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(labelText: 'Event name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Add event'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name == null) return;
    final normalized = name.toLowerCase();
    if (name.isEmpty ||
        eventOptions.values.any((event) => event.toLowerCase() == normalized) ||
        _custom.values.any((event) => event.toLowerCase() == normalized)) {
      showMessage(
        context,
        'Enter a new event name that is not already listed.',
      );
      return;
    }
    final key =
        'custom_${normalized.replaceAll(RegExp(r'[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_|_$'), '')}';
    setState(() {
      _custom[key] = name;
      _selected.add(key);
    });
  }

  Future<void> _generate() async {
    if (_selected.isEmpty) {
      showMessage(context, validateEventSelection(_selected.length)!);
      return;
    }
    final wedding = _wedding;
    if (wedding == null) {
      showMessage(context, 'Please save your wedding details first.');
      context.go('/setup');
      return;
    }
    if (wedding.planGenerated) {
      final proceed =
          await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Generate again?'),
              content: const Text(
                'Generating again will add missing items only. Your existing items are kept.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ) ??
          false;
      if (!proceed) return;
    }
    setState(() => _generating = true);
    try {
      final summary = await PlanGenerator(ref.read(databaseProvider)).generate(
        wedding: wedding,
        eventKeys: _selected.toList(),
        customEvents: _custom,
      );
      if (mounted) context.go('/generated', extra: summary);
    } catch (_) {
      if (!mounted) return;
      setState(() => _generating = false);
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Plan not generated'),
          content: const Text(
            'Something went wrong. Your wedding details are saved. Please try again.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                _generate();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_generating) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 18),
              Text('Generating your plan…'),
            ],
          ),
        ),
      );
    }
    return PageFrame(
      title: 'Choose your events',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select every celebration you’re planning. We’ll tailor each checklist.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final entry in eventOptions.entries)
                FilterChip(
                  label: Text(entry.value),
                  selected: _selected.contains(entry.key),
                  onSelected: (selected) => setState(
                    () => selected
                        ? _selected.add(entry.key)
                        : _selected.remove(entry.key),
                  ),
                ),
              for (final entry in _custom.entries)
                FilterChip(
                  label: Text(entry.value),
                  selected: _selected.contains(entry.key),
                  onSelected: (selected) => setState(
                    () => selected
                        ? _selected.add(entry.key)
                        : _selected.remove(entry.key),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _addCustomEvent,
            icon: const Icon(Icons.add),
            label: const Text('Custom Event'),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton(
              onPressed: _generate,
              child: const Text('Generate My Plan'),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratedScreen extends StatelessWidget {
  const GeneratedScreen({super.key, required this.summary});
  final Object? summary;
  @override
  Widget build(BuildContext context) {
    final result = summary is PlanSummary ? summary as PlanSummary : null;
    return PageFrame(
      title: 'Your plan is ready',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, color: WedlyColors.gold, size: 30),
                SizedBox(height: 12),
                Text(
                  'A thoughtful start, made for your wedding.',
                  style: TextStyle(
                    fontFamily: 'CormorantGaramond',
                    fontSize: 25,
                    color: WedlyColors.plum,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Your plan is saved on this device and is ready for you to make it your own.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (result != null)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _CountCard(label: 'Events', count: result.events),
                _CountCard(label: 'Tasks', count: result.tasks),
                _CountCard(
                  label: 'Vendor types',
                  count: result.vendorCategories,
                ),
                _CountCard(
                  label: 'Shopping lists',
                  count: result.shoppingCategories,
                ),
                _CountCard(
                  label: 'Budget categories',
                  count: result.budgetCategories,
                ),
              ],
            ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/home'),
              child: const Text('View My Plan'),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountCard extends StatelessWidget {
  const _CountCard({required this.label, required this.count});
  final String label;
  final int count;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 145,
    child: SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$count', style: Theme.of(context).textTheme.headlineMedium),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    ),
  );
}
