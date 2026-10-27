import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/widgets/common.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StreamBuilder<Wedding?>(
    stream: ref.watch(repositoryProvider).watchWedding(),
    builder: (context, weddingSnapshot) {
      final wedding = weddingSnapshot.data;
      if (wedding == null) {
        return PageFrame(
          title: 'Your events',
          child: EmptyState(
            icon: Icons.event,
            message: 'No wedding yet.',
            buttonText: 'Create My Wedding',
            onPressed: () => context.go('/setup'),
          ),
        );
      }
      return PageFrame(
        title: 'Your events',
        action: IconButton(
          tooltip: 'Add event',
          onPressed: () => _addEvent(context, ref, wedding.id),
          icon: const Icon(Icons.add),
        ),
        child: StreamBuilder<List<Event>>(
          stream: ref.watch(repositoryProvider).watchEvents(wedding.id),
          builder: (context, eventSnapshot) {
            final events = eventSnapshot.data ?? const <Event>[];
            if (events.isEmpty) {
              return EmptyState(
                icon: Icons.event_note_outlined,
                message: 'Your plan is ready to generate.',
                buttonText: 'Choose events',
                onPressed: () => context.go('/select-events'),
              );
            }
            return Column(
              children: [
                for (final event in events)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _EventTile(event: event),
                  ),
              ],
            );
          },
        ),
      );
    },
  );

  Future<void> _addEvent(
    BuildContext context,
    WidgetRef ref,
    int weddingId,
  ) async {
    final name = await _textDialog(
      context,
      title: 'Add an event',
      label: 'Event name',
    );
    if (name == null || name.trim().isEmpty) return;
    await ref.read(repositoryProvider).addEvent(weddingId, name);
  }
}

class _EventTile extends ConsumerWidget {
  const _EventTile({required this.event});
  final Event event;
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      StreamBuilder<List<ChecklistItem>>(
        stream: ref.watch(repositoryProvider).watchChecklist(event.id),
        builder: (context, snapshot) {
          final items = snapshot.data ?? const <ChecklistItem>[];
          final done = items.where((item) => item.isDone).length;
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => context.go('/plan/event/${event.id}'),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: WedlyColors.blush,
                          child: Icon(
                            Icons.celebration_outlined,
                            color: WedlyColors.rose,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: WedlyColors.plum,
                                ),
                              ),
                              Text(
                                '$done / ${items.length} checklist items',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: WedlyColors.muted,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ProgressMeter(
                      value: items.isEmpty ? 0 : done / items.length,
                      label: '${event.name} checklist progress',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

class EventDetailScreen extends ConsumerStatefulWidget {
  const EventDetailScreen({super.key, required this.eventId});
  final int eventId;
  @override
  ConsumerState<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  Event? _event;
  @override
  void initState() {
    super.initState();
    ref.read(repositoryProvider).getEvent(widget.eventId).then((event) {
      if (mounted) setState(() => _event = event);
    });
  }

  Future<void> _add() async {
    final title = await _textDialog(
      context,
      title: 'Add checklist item',
      label: 'Item name',
    );
    if (title == null || title.trim().isEmpty) return;
    await ref.read(repositoryProvider).addChecklistItem(widget.eventId, title);
  }

  @override
  Widget build(BuildContext context) {
    final event = _event;
    if (event == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return PageFrame(
      title: event.name,
      action: IconButton(
        tooltip: 'Add checklist item',
        onPressed: _add,
        icon: const Icon(Icons.add),
      ),
      child: StreamBuilder<List<ChecklistItem>>(
        stream: ref.watch(repositoryProvider).watchChecklist(widget.eventId),
        builder: (context, snapshot) {
          final items = snapshot.data ?? const <ChecklistItem>[];
          final done = items.where((item) => item.isDone).length;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$done / ${items.length} complete',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Text(
                          '${items.isEmpty ? 0 : (done / items.length * 100).round()}%',
                          style: const TextStyle(
                            color: WedlyColors.rose,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ProgressMeter(
                      value: items.isEmpty ? 0 : done / items.length,
                      label: '${event.name} checklist progress',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (items.isEmpty)
                EmptyState(
                  icon: Icons.checklist,
                  message: 'No checklist items yet.',
                  buttonText: 'Add Item',
                  onPressed: _add,
                )
              else
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: item.isDone,
                          semanticLabel:
                              'Mark ${item.title} ${item.isDone ? 'incomplete' : 'complete'}',
                          onChanged: (value) => ref
                              .read(repositoryProvider)
                              .updateChecklistItem(
                                item.id,
                                done: value ?? false,
                              ),
                        ),
                        title: Text(
                          item.title,
                          style: TextStyle(
                            decoration: item.isDone
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          tooltip: 'Checklist item actions',
                          onSelected: (action) async {
                            if (action == 'edit') {
                              final title = await _textDialog(
                                context,
                                title: 'Edit checklist item',
                                label: 'Item name',
                                initial: item.title,
                              );
                              if (title != null && title.trim().isNotEmpty) {
                                await ref
                                    .read(repositoryProvider)
                                    .updateChecklistItem(item.id, title: title);
                              }
                            } else if (await confirmDelete(
                              context,
                              item: 'this checklist item',
                            )) {
                              await ref
                                  .read(repositoryProvider)
                                  .deleteChecklistItem(item.id);
                              if (context.mounted) {
                                showMessage(context, 'Checklist item deleted.');
                              }
                            }
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(value: 'edit', child: Text('Edit')),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}

Future<String?> _textDialog(
  BuildContext context, {
  required String title,
  required String label,
  String? initial,
}) async {
  final controller = TextEditingController(text: initial);
  final result = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: label),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text('Save'),
        ),
      ],
    ),
  );
  controller.dispose();
  return result;
}
