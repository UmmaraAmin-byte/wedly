import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StreamBuilder<Wedding?>(
    stream: ref.watch(repositoryProvider).watchWedding(),
    builder: (context, snapshot) {
      final wedding = snapshot.data;
      if (wedding == null) {
        return PageFrame(
          title: 'Home',
          child: EmptyState(
            icon: Icons.favorite_border,
            message: 'No wedding yet.',
            buttonText: 'Create My Wedding',
            onPressed: () => context.go('/setup'),
          ),
        );
      }
      return _DashboardContent(wedding: wedding);
    },
  );
}

class _DashboardContent extends ConsumerWidget {
  const _DashboardContent({required this.wedding});
  final Wedding wedding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(repositoryProvider);
    final days = countdownDays(wedding.weddingDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedly'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
        children: [
          Container(
            decoration: BoxDecoration(
              color: WedlyColors.plum,
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [WedlyColors.plum, WedlyColors.rose],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'YOUR CELEBRATION',
                  style: TextStyle(
                    color: WedlyColors.blush,
                    letterSpacing: 1.8,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  wedding.name,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  '${wedding.city}  ·  ${wedding.guestCount} guests',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: WedlyColors.gold,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      days == 0
                          ? 'Wedding day!'
                          : days < 0
                          ? 'Your wedding day has passed'
                          : '$days days to go',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formatDate(wedding.weddingDate),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          StreamBuilder<List<Event>>(
            stream: repository.watchEvents(wedding.id),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionHeading(
                    title: 'Your progress',
                    action: 'View plan',
                    onTap: () => context.go('/plan'),
                  ),
                  const SizedBox(height: 10),
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<List<Task>>(
                          stream: repository.watchTasks(wedding.id),
                          builder: (context, taskSnapshot) {
                            final tasks = taskSnapshot.data ?? const <Task>[];
                            return _OverallProgress(
                              events: events,
                              tasks: tasks,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        for (final event in events.take(4))
                          _EventProgressRow(event: event),
                        if (events.length > 4)
                          TextButton(
                            onPressed: () => context.go('/plan'),
                            child: Text('And ${events.length - 4} more events'),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SectionHeading(
                    title: 'Coming up',
                    action: 'All tasks',
                    onTap: () => context.go('/manage/tasks'),
                  ),
                  const SizedBox(height: 10),
                  StreamBuilder<List<Task>>(
                    stream: repository.watchTasks(wedding.id),
                    builder: (context, taskSnapshot) {
                      final open =
                          (taskSnapshot.data ?? const <Task>[])
                              .where((task) => task.status != 'done')
                              .toList()
                            ..sort((a, b) {
                              if (a.dueDate == null) return 1;
                              if (b.dueDate == null) return -1;
                              return a.dueDate!.compareTo(b.dueDate!);
                            });
                      if (open.isEmpty) {
                        return const SectionCard(
                          child: Text(
                            'No upcoming tasks. Add one when you’re ready.',
                          ),
                        );
                      }
                      return SectionCard(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            for (final task in open.take(3))
                              ListTile(
                                leading: const Icon(
                                  Icons.radio_button_unchecked,
                                  color: WedlyColors.rose,
                                ),
                                title: Text(task.name),
                                subtitle: task.dueDate == null
                                    ? const Text('No due date')
                                    : Text('Due ${formatDate(task.dueDate!)}'),
                                trailing:
                                    task.dueDate != null &&
                                        task.dueDate!.isBefore(DateTime.now())
                                    ? const Chip(label: Text('Overdue'))
                                    : null,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  StreamBuilder<List<BudgetItem>>(
                    stream: repository.watchBudget(wedding.id),
                    builder: (context, budgetSnapshot) {
                      final budget =
                          budgetSnapshot.data ?? const <BudgetItem>[];
                      final actual = budget.fold<int>(
                        0,
                        (sum, item) => sum + item.actual,
                      );
                      return ModuleTile(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Budget',
                        subtitle:
                            '${formatPkr(wedding.totalBudget)} total · ${formatPkr(wedding.totalBudget - actual)} remaining',
                        onTap: () => context.go('/budget'),
                        tint: WedlyColors.sage,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  StreamBuilder<List<Guest>>(
                    stream: repository.watchGuests(wedding.id),
                    builder: (context, guestSnapshot) {
                      final guests = guestSnapshot.data ?? const <Guest>[];
                      final invited = guestTotal(
                        guests.map((guest) => guest.peopleCount),
                      );
                      final confirmed = guestTotal(
                        guests
                            .where((guest) => guest.rsvp == 'confirmed')
                            .map((guest) => guest.peopleCount),
                      );
                      final pending = guestTotal(
                        guests
                            .where((guest) => guest.rsvp == 'pending')
                            .map((guest) => guest.peopleCount),
                      );
                      final declined = guestTotal(
                        guests
                            .where((guest) => guest.rsvp == 'declined')
                            .map((guest) => guest.peopleCount),
                      );
                      return SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guest list',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: WedlyColors.plum,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$invited invited  ·  $confirmed confirmed  ·  $pending pending  ·  $declined declined',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _SectionHeading(
                    title: 'Plan your way',
                    action: null,
                    onTap: null,
                  ),
                  const SizedBox(height: 10),
                  ModuleTile(
                    icon: Icons.checklist,
                    title: 'Tasks',
                    subtitle: 'Keep every detail moving',
                    onTap: () => context.go('/manage/tasks'),
                  ),
                  const SizedBox(height: 10),
                  ModuleTile(
                    icon: Icons.storefront_outlined,
                    title: 'Vendors',
                    subtitle: 'Contacts and payment balances',
                    onTap: () => context.go('/manage'),
                  ),
                  const SizedBox(height: 10),
                  ModuleTile(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Shopping',
                    subtitle: 'Your wedding essentials',
                    onTap: () => context.go('/manage/shopping'),
                    tint: WedlyColors.sage,
                  ),
                  const SizedBox(height: 10),
                  ModuleTile(
                    icon: Icons.people_outline,
                    title: 'Guests',
                    subtitle: 'Guest groups and RSVPs',
                    onTap: () => context.go('/manage/guests'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OverallProgress extends ConsumerWidget {
  const _OverallProgress({required this.events, required this.tasks});
  final List<Event> events;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(repositoryProvider);
    return FutureBuilder<List<List<ChecklistItem>>>(
      future: Future.wait(
        events.map((event) => repository.watchChecklist(event.id).first),
      ),
      builder: (context, snapshot) {
        final checklists = snapshot.data ?? const <List<ChecklistItem>>[];
        final allItems =
            checklists.fold<int>(0, (sum, list) => sum + list.length) +
            tasks.length;
        final completed =
            checklists.fold<int>(
              0,
              (sum, list) => sum + list.where((item) => item.isDone).length,
            ) +
            tasks.where((task) => task.status == 'done').length;
        final ratio = progressRatio(completed, allItems);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Overall progress',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '${(ratio * 100).round()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: WedlyColors.rose,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            ProgressMeter(value: ratio, label: 'Overall wedding plan progress'),
            const SizedBox(height: 6),
            Text(
              '$completed of $allItems planning items complete',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}

class _EventProgressRow extends ConsumerWidget {
  const _EventProgressRow({required this.event});
  final Event event;
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      StreamBuilder<List<ChecklistItem>>(
        stream: ref.watch(repositoryProvider).watchChecklist(event.id),
        builder: (context, snapshot) {
          final items = snapshot.data ?? const <ChecklistItem>[];
          final done = items.where((item) => item.isDone).length;
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                Expanded(child: Text(event.name)),
                Text(
                  '$done / ${items.length}',
                  style: const TextStyle(color: WedlyColors.muted),
                ),
              ],
            ),
          );
        },
      );
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.title,
    required this.action,
    required this.onTap,
  });
  final String title;
  final String? action;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
      if (action != null) TextButton(onPressed: onTap, child: Text(action!)),
    ],
  );
}
