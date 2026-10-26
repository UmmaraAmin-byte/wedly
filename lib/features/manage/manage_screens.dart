import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';

class ManagementScreen extends ConsumerWidget {
  const ManagementScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
        title: 'Manage your plan',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Everything in one place, ready to update as plans come together.', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          ModuleTile(icon: Icons.checklist, title: 'Tasks', subtitle: 'Assignments, dates and progress', onTap: () => context.go('/manage/tasks')),
          const SizedBox(height: 10),
          ModuleTile(icon: Icons.storefront_outlined, title: 'Vendors', subtitle: 'Contacts, bookings and payments', onTap: () => context.go('/manage/vendors-hub')),
          const SizedBox(height: 10),
          ModuleTile(icon: Icons.people_outline, title: 'Guests', subtitle: 'Groups and RSVP tracking', onTap: () => context.go('/manage/guests'), tint: WedlyColors.sage),
          const SizedBox(height: 10),
          ModuleTile(icon: Icons.shopping_bag_outlined, title: 'Shopping', subtitle: 'Needed and purchased items', onTap: () => context.go('/manage/shopping'), tint: WedlyColors.blush),
        ]),
      );
}

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});
  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) => StreamBuilder<Wedding?>(
        stream: ref.watch(repositoryProvider).watchWedding(),
        builder: (context, weddingSnapshot) {
          final wedding = weddingSnapshot.data;
          if (wedding == null) return PageFrame(title: 'Tasks', child: EmptyState(icon: Icons.checklist, message: 'No wedding yet.', buttonText: 'Create My Wedding', onPressed: () => context.go('/setup')));
          final repository = ref.watch(repositoryProvider);
          return PageFrame(
            title: 'Tasks',
            action: IconButton(tooltip: 'Add task', onPressed: () => _editTask(context, wedding), icon: const Icon(Icons.add)),
            child: StreamBuilder<List<Task>>(
              stream: repository.watchTasks(wedding.id),
              builder: (context, snapshot) {
                final all = snapshot.data ?? const <Task>[];
                final tasks = all.where((task) => _filter == 'all' || task.status == _filter).toList()
                  ..sort((a, b) {
                    if (a.dueDate == null) return 1;
                    if (b.dueDate == null) return -1;
                    return a.dueDate!.compareTo(b.dueDate!);
                  });
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Wrap(spacing: 7, children: [
                    for (final filter in const [('all', 'All'), ('todo', 'To Do'), ('in_progress', 'In Progress'), ('done', 'Done')])
                      ChoiceChip(label: Text(filter.$2), selected: _filter == filter.$1, onSelected: (_) => setState(() => _filter = filter.$1)),
                  ]),
                  const SizedBox(height: 15),
                  if (all.isEmpty)
                    EmptyState(icon: Icons.checklist, message: 'No tasks yet. Add your first task to start planning.', buttonText: 'Add Task', onPressed: () => _editTask(context, wedding))
                  else if (tasks.isEmpty)
                    EmptyState(icon: Icons.search_off, message: 'No results found.', buttonText: 'Clear Filter', onPressed: () => setState(() => _filter = 'all'))
                  else
                    for (final task in tasks)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: task.status == 'done',
                              semanticLabel: 'Mark ${task.name} ${task.status == 'done' ? 'not done' : 'done'}',
                              onChanged: (done) => repository.saveTask(
                                id: task.id, weddingId: wedding.id, eventId: task.eventId, name: task.name, dueDate: task.dueDate, assignee: task.assignee,
                                status: done == true ? 'done' : 'todo',
                              ),
                            ),
                            title: Text(task.name, style: TextStyle(decoration: task.status == 'done' ? TextDecoration.lineThrough : null)),
                            subtitle: Text([
                              if (task.dueDate != null) 'Due ${formatDate(task.dueDate!)}',
                              if (task.assignee?.isNotEmpty == true) 'Assigned to ${task.assignee}',
                              task.status == 'in_progress' ? 'In progress' : '',
                            ].where((part) => part.isNotEmpty).join(' · ')),
                            trailing: PopupMenuButton<String>(
                              tooltip: 'Task actions',
                              onSelected: (action) async {
                                if (action == 'edit') {
                                  await _editTask(context, wedding, task: task);
                                } else if (action == 'progress') {
                                  await repository.saveTask(id: task.id, weddingId: wedding.id, eventId: task.eventId, name: task.name, dueDate: task.dueDate, assignee: task.assignee, status: task.status == 'todo' ? 'in_progress' : 'todo');
                                } else if (await confirmDelete(context, item: 'this task')) {
                                  await repository.deleteTask(task.id);
                                  if (context.mounted) showMessage(context, 'Task deleted.');
                                }
                              },
                              itemBuilder: (_) => [
                                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                                PopupMenuItem(value: 'progress', child: Text(task.status == 'in_progress' ? 'Move to To Do' : 'Mark In Progress')),
                                const PopupMenuItem(value: 'delete', child: Text('Delete')),
                              ],
                            ),
                            isThreeLine: false,
                          ),
                        ),
                      ),
                ]);
              },
            ),
          );
        },
      );

  Future<void> _editTask(BuildContext context, Wedding wedding, {Task? task}) async {
    final repository = ref.read(repositoryProvider);
    final events = await repository.watchEvents(wedding.id).first;
    if (!context.mounted) return;
    final name = TextEditingController(text: task?.name ?? '');
    final assignee = TextEditingController(text: task?.assignee ?? '');
    final dueDate = ValueNotifier<DateTime?>(task?.dueDate);
    final eventId = ValueNotifier<int?>(task?.eventId);
    final status = ValueNotifier<String>(task?.status ?? 'todo');
    final form = GlobalKey<FormState>();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task == null ? 'Add task' : 'Edit task'),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextFormField(controller: name, autofocus: true, validator: (value) => value == null || value.trim().isEmpty ? 'Please enter a task name.' : null, decoration: const InputDecoration(labelText: 'Task name')),
                const SizedBox(height: 12),
                ValueListenableBuilder<int?>(
                  valueListenable: eventId,
                  builder: (_, selected, __) => DropdownButtonFormField<int?>(
                    initialValue: selected,
                    decoration: const InputDecoration(labelText: 'Event (optional)'),
                    items: [const DropdownMenuItem<int?>(value: null, child: Text('No event')), ...events.map((event) => DropdownMenuItem<int?>(value: event.id, child: Text(event.name)))],
                    onChanged: (value) => eventId.value = value,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(controller: assignee, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Assigned to (optional)')),
                const SizedBox(height: 12),
                ValueListenableBuilder<DateTime?>(
                  valueListenable: dueDate,
                  builder: (context, date, _) => OutlinedButton.icon(
                    onPressed: () async {
                      final picked = await showDatePicker(context: context, initialDate: date ?? wedding.weddingDate, firstDate: DateTime.now().subtract(const Duration(days: 365)), lastDate: wedding.weddingDate.add(const Duration(days: 365)));
                      if (picked != null) dueDate.value = picked;
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: Text(date == null ? 'Choose due date' : formatDate(date)),
                  ),
                ),
                const SizedBox(height: 8),
                ValueListenableBuilder<String>(
                  valueListenable: status,
                  builder: (_, value, __) => DropdownButtonFormField<String>(
                    initialValue: value,
                    decoration: const InputDecoration(labelText: 'Status'),
                    items: const [
                      DropdownMenuItem(value: 'todo', child: Text('To Do')),
                      DropdownMenuItem(value: 'in_progress', child: Text('In Progress')),
                      DropdownMenuItem(value: 'done', child: Text('Done')),
                    ],
                    onChanged: (value) => status.value = value ?? 'todo',
                  ),
                ),
              ]),
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () { if (form.currentState!.validate()) Navigator.pop(context, true); }, child: const Text('Save')),
        ],
      ),
    );
    if (result == true) await repository.saveTask(
      id: task?.id, weddingId: wedding.id, eventId: eventId.value, name: name.text, dueDate: dueDate.value, assignee: assignee.text, status: status.value,
    );
    name.dispose();
    assignee.dispose();
    dueDate.dispose();
    eventId.dispose();
    status.dispose();
  }
}

class VendorsHubScreen extends ConsumerWidget {
  const VendorsHubScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StreamBuilder<Wedding?>(
        stream: ref.watch(repositoryProvider).watchWedding(),
        builder: (context, snapshot) {
          final wedding = snapshot.data;
          if (wedding == null) return const PageFrame(title: 'Vendors', child: Text('No wedding yet.'));
          return PageFrame(
            title: 'Vendor categories',
            child: StreamBuilder<List<VendorCategory>>(
              stream: ref.watch(repositoryProvider).watchVendorCategories(wedding.id),
              builder: (context, categoriesSnapshot) {
                final categories = categoriesSnapshot.data ?? const <VendorCategory>[];
                if (categories.isEmpty) return const EmptyState(icon: Icons.storefront_outlined, message: 'No vendor categories yet. Generate your plan first.', buttonText: 'Choose events', onPressed: null);
                return Column(children: [
                  for (final category in categories)
                    StreamBuilder<List<Vendor>>(
                      stream: ref.watch(repositoryProvider).watchVendors(category.id),
                      builder: (context, vendorSnapshot) {
                        final vendors = vendorSnapshot.data ?? const <Vendor>[];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ModuleTile(
                            icon: Icons.storefront_outlined,
                            title: category.name,
                            subtitle: '${vendors.length} ${vendors.length == 1 ? 'vendor' : 'vendors'}',
                            onTap: () => context.go('/manage/vendors/${category.id}'),
                          ),
                        );
                      },
                    ),
                ]);
              },
            ),
          );
        },
      );
}

class VendorListScreen extends ConsumerStatefulWidget {
  const VendorListScreen({super.key, required this.categoryId});
  final int categoryId;
  @override
  ConsumerState<VendorListScreen> createState() => _VendorListScreenState();
}

class _VendorListScreenState extends ConsumerState<VendorListScreen> {
  VendorCategory? _category;
  @override
  void initState() {
    super.initState();
    ref.read(repositoryProvider).getVendorCategory(widget.categoryId).then((value) { if (mounted) setState(() => _category = value); });
  }
  @override
  Widget build(BuildContext context) {
    final category = _category;
    if (category == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return PageFrame(
      title: category.name,
      action: IconButton(tooltip: 'Add vendor', onPressed: () => _editVendor(context), icon: const Icon(Icons.add)),
      child: StreamBuilder<List<Vendor>>(
        stream: ref.watch(repositoryProvider).watchVendors(category.id),
        builder: (context, snapshot) {
          final vendors = snapshot.data ?? const <Vendor>[];
          if (vendors.isEmpty) return EmptyState(icon: Icons.storefront_outlined, message: 'No vendors added yet. Keep your vendor details and payments organized in one place.', buttonText: 'Add Vendor', onPressed: () => _editVendor(context));
          return Column(children: [
            for (final vendor in vendors)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SectionCard(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Expanded(child: Text(vendor.name, style: const TextStyle(fontWeight: FontWeight.w700, color: WedlyColors.plum, fontSize: 17))),
                      PopupMenuButton<String>(
                        onSelected: (action) async {
                          if (action == 'edit') {
                            await _editVendor(context, vendor: vendor);
                          } else if (await confirmDelete(context, item: 'this vendor')) {
                            await ref.read(repositoryProvider).deleteVendor(vendor.id);
                            if (context.mounted) showMessage(context, 'Vendor deleted.');
                          }
                        },
                        itemBuilder: (_) => const [PopupMenuItem(value: 'edit', child: Text('Edit')), PopupMenuItem(value: 'delete', child: Text('Delete'))],
                      ),
                    ]),
                    if (vendor.contact?.isNotEmpty == true) Text(vendor.contact!),
                    const SizedBox(height: 9),
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      _SmallPill(label: 'Price ${formatPkr(vendor.price)}'),
                      _SmallPill(label: 'Advance ${formatPkr(vendor.advancePaid)}'),
                      _SmallPill(label: 'Remaining ${formatPkr(vendor.price - vendor.advancePaid)}'),
                      _SmallPill(label: vendor.bookingStatus.replaceAll('_', ' ')),
                    ]),
                    if (vendor.notes?.isNotEmpty == true) ...[const SizedBox(height: 8), Text(vendor.notes!)],
                  ]),
                ),
              ),
          ]);
        },
      ),
    );
  }

  Future<void> _editVendor(BuildContext context, {Vendor? vendor}) async {
    final name = TextEditingController(text: vendor?.name ?? '');
    final contact = TextEditingController(text: vendor?.contact ?? '');
    final price = TextEditingController(text: vendor == null ? '' : '${vendor.price}');
    final advance = TextEditingController(text: vendor == null ? '0' : '${vendor.advancePaid}');
    final notes = TextEditingController(text: vendor?.notes ?? '');
    var status = vendor?.bookingStatus ?? 'not_contacted';
    final form = GlobalKey<FormState>();
    final save = await showDialog<bool>(context: context, builder: (context) => StatefulBuilder(builder: (context, setState) => AlertDialog(
      title: Text(vendor == null ? 'Add vendor' : 'Edit vendor'),
      content: SizedBox(width: 420, child: SingleChildScrollView(child: Form(key: form, child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(controller: name, validator: (v) => v == null || v.trim().isEmpty ? 'Enter a vendor name.' : null, decoration: const InputDecoration(labelText: 'Name')),
        const SizedBox(height: 10),
        TextField(controller: contact, decoration: const InputDecoration(labelText: 'Contact')),
        const SizedBox(height: 10),
        TextFormField(controller: price, keyboardType: TextInputType.number, validator: (v) => int.tryParse(v ?? '') == null || int.parse(v!) < 0 ? 'Enter a valid price.' : null, decoration: const InputDecoration(labelText: 'Price', prefixText: 'PKR ')),
        const SizedBox(height: 10),
        TextFormField(controller: advance, keyboardType: TextInputType.number, validator: (v) {
          final paid = int.tryParse(v ?? '');
          final total = int.tryParse(price.text);
          if (paid == null || paid < 0) return 'Enter a valid advance.';
          if (total != null && paid > total) return 'Advance cannot be greater than price.';
          return null;
        }, decoration: const InputDecoration(labelText: 'Advance paid', prefixText: 'PKR ')),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(initialValue: status, decoration: const InputDecoration(labelText: 'Booking status'), items: const [
          DropdownMenuItem(value: 'not_contacted', child: Text('Not contacted')),
          DropdownMenuItem(value: 'in_talks', child: Text('In talks')),
          DropdownMenuItem(value: 'booked', child: Text('Booked')),
          DropdownMenuItem(value: 'cancelled', child: Text('Cancelled')),
        ], onChanged: (value) => setState(() => status = value ?? status)),
        const SizedBox(height: 10),
        TextField(controller: notes, maxLines: 3, decoration: const InputDecoration(labelText: 'Notes')),
      ])))),
      actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')), FilledButton(onPressed: () { if (form.currentState!.validate()) Navigator.pop(context, true); }, child: const Text('Save'))],
    )));
    if (save == true) await ref.read(repositoryProvider).saveVendor(
      id: vendor?.id, categoryId: widget.categoryId, name: name.text, contact: contact.text, price: int.parse(price.text), advance: int.parse(advance.text), status: status, notes: notes.text,
    );
    name.dispose(); contact.dispose(); price.dispose(); advance.dispose(); notes.dispose();
  }
}

class GuestsScreen extends ConsumerStatefulWidget {
  const GuestsScreen({super.key});
  @override
  ConsumerState<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends ConsumerState<GuestsScreen> {
  final _search = TextEditingController();
  String _rsvp = 'all';
  @override
  void dispose() { _search.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => StreamBuilder<Wedding?>(
        stream: ref.watch(repositoryProvider).watchWedding(),
        builder: (context, weddingSnapshot) {
          final wedding = weddingSnapshot.data;
          if (wedding == null) return const PageFrame(title: 'Guests', child: Text('No wedding yet.'));
          final repository = ref.watch(repositoryProvider);
          return PageFrame(
            title: 'Guests',
            action: IconButton(tooltip: 'Add guest', onPressed: () => _editGuest(context, wedding), icon: const Icon(Icons.add)),
            child: StreamBuilder<List<Guest>>(
              stream: repository.watchGuests(wedding.id),
              builder: (context, snapshot) {
                final all = snapshot.data ?? const <Guest>[];
                final guests = all.where((guest) =>
                    guest.name.toLowerCase().contains(_search.text.toLowerCase()) &&
                    (_rsvp == 'all' || guest.rsvp == _rsvp)).toList();
                final invited = guestTotal(all.map((guest) => guest.peopleCount));
                final confirmed = guestTotal(all.where((g) => g.rsvp == 'confirmed').map((g) => g.peopleCount));
                final pending = guestTotal(all.where((g) => g.rsvp == 'pending').map((g) => g.peopleCount));
                final declined = guestTotal(all.where((g) => g.rsvp == 'declined').map((g) => g.peopleCount));
                return Column(children: [
                  SectionCard(child: Text('$invited invited  ·  $confirmed confirmed  ·  $pending pending  ·  $declined declined', style: const TextStyle(fontWeight: FontWeight.w600))),
                  const SizedBox(height: 12),
                  TextField(controller: _search, onChanged: (_) => setState(() {}), decoration: const InputDecoration(prefixIcon: Icon(Icons.search), labelText: 'Search guests')),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    initialValue: _rsvp,
                    decoration: const InputDecoration(labelText: 'RSVP status'),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('All RSVPs')),
                      DropdownMenuItem(value: 'pending', child: Text('Pending')),
                      DropdownMenuItem(value: 'confirmed', child: Text('Confirmed')),
                      DropdownMenuItem(value: 'declined', child: Text('Declined')),
                    ],
                    onChanged: (value) => setState(() => _rsvp = value ?? 'all'),
                  ),
                  const SizedBox(height: 14),
                  if (all.isEmpty)
                    EmptyState(icon: Icons.people_outline, message: 'Your guest list is empty. Add your first guest to start tracking RSVPs.', buttonText: 'Add Guest', onPressed: () => _editGuest(context, wedding))
                  else if (guests.isEmpty)
                    EmptyState(icon: Icons.search_off, message: 'No results found.', buttonText: 'Clear Filter', onPressed: () { _search.clear(); setState(() => _rsvp = 'all'); })
                  else
                    for (final guest in guests)
                      Padding(padding: const EdgeInsets.only(bottom: 8), child: Card(child: ListTile(
                        leading: const CircleAvatar(backgroundColor: WedlyColors.blush, child: Icon(Icons.person_outline, color: WedlyColors.rose)),
                        title: Text(guest.name),
                        subtitle: Text('${guest.peopleCount} people · ${guest.groupName?.isEmpty == false ? '${guest.groupName} · ' : ''}${guest.rsvp}'),
                        trailing: PopupMenuButton<String>(
                          onSelected: (action) async {
                            if (action == 'edit') await _editGuest(context, wedding, guest: guest);
                            else if (await confirmDelete(context, item: 'this guest')) {
                              await repository.deleteGuest(guest.id);
                              if (context.mounted) showMessage(context, 'Guest deleted.');
                            }
                          },
                          itemBuilder: (_) => const [PopupMenuItem(value: 'edit', child: Text('Edit')), PopupMenuItem(value: 'delete', child: Text('Delete'))],
                        ),
                      ))),
                ]);
              },
            ),
          );
        },
      );

  Future<void> _editGuest(BuildContext context, Wedding wedding, {Guest? guest}) async {
    final repository = ref.read(repositoryProvider);
    final events = await repository.watchEvents(wedding.id).first;
    final selected = ValueNotifier<Set<int>>(
      guest == null ? <int>{} : (await repository.getGuestEvents(guest.id)).toSet(),
    );
    final name = TextEditingController(text: guest?.name ?? '');
    final group = TextEditingController(text: guest?.groupName ?? '');
    final people = TextEditingController(text: '${guest?.peopleCount ?? 1}');
    final rsvp = ValueNotifier<String>(guest?.rsvp ?? 'pending');
    final form = GlobalKey<FormState>();
    final saved = await showDialog<bool>(context: context, builder: (context) => AlertDialog(
      title: Text(guest == null ? 'Add guest' : 'Edit guest'),
      content: SizedBox(width: 420, child: SingleChildScrollView(child: Form(key: form, child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(controller: name, validator: (v) => v == null || v.trim().isEmpty ? 'Enter a guest name.' : null, decoration: const InputDecoration(labelText: 'Name')),
        const SizedBox(height: 10),
        TextField(controller: group, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Group')),
        const SizedBox(height: 10),
        TextFormField(controller: people, keyboardType: TextInputType.number, validator: (v) => int.tryParse(v ?? '') == null || int.parse(v!) < 1 ? 'People count must be 1 or more.' : null, decoration: const InputDecoration(labelText: 'Number of people')),
        const SizedBox(height: 10),
        ValueListenableBuilder<String>(valueListenable: rsvp, builder: (_, value, __) => DropdownButtonFormField<String>(
          initialValue: value, decoration: const InputDecoration(labelText: 'RSVP'),
          items: const [DropdownMenuItem(value: 'pending', child: Text('Pending')), DropdownMenuItem(value: 'confirmed', child: Text('Confirmed')), DropdownMenuItem(value: 'declined', child: Text('Declined'))],
          onChanged: (value) => rsvp.value = value ?? 'pending',
        )),
        const SizedBox(height: 10),
        Align(alignment: Alignment.centerLeft, child: Text('Events attended', style: Theme.of(context).textTheme.bodySmall)),
        for (final event in events)
          ValueListenableBuilder<Set<int>>(valueListenable: selected, builder: (_, ids, __) => CheckboxListTile(
            contentPadding: EdgeInsets.zero, dense: true, title: Text(event.name), value: ids.contains(event.id),
            onChanged: (checked) { final next = {...ids}; checked == true ? next.add(event.id) : next.remove(event.id); selected.value = next; },
          )),
      ])))),
      actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')), FilledButton(onPressed: () { if (form.currentState!.validate()) Navigator.pop(context, true); }, child: const Text('Save'))],
    ));
    if (saved == true) await repository.saveGuest(
      id: guest?.id, weddingId: wedding.id, name: name.text, group: group.text, people: int.parse(people.text), rsvp: rsvp.value, eventIds: selected.value.toList(),
    );
    selected.dispose(); rsvp.dispose(); name.dispose(); group.dispose(); people.dispose();
  }
}

class ShoppingScreen extends ConsumerStatefulWidget {
  const ShoppingScreen({super.key});
  @override
  ConsumerState<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends ConsumerState<ShoppingScreen> {
  static const categories = ['bride', 'groom', 'events', 'gifts', 'other'];
  String _category = 'bride';
  @override
  Widget build(BuildContext context) => StreamBuilder<Wedding?>(
        stream: ref.watch(repositoryProvider).watchWedding(),
        builder: (context, weddingSnapshot) {
          final wedding = weddingSnapshot.data;
          if (wedding == null) return const PageFrame(title: 'Shopping', child: Text('No wedding yet.'));
          final repo = ref.watch(repositoryProvider);
          return PageFrame(
            title: 'Shopping',
            action: IconButton(tooltip: 'Add shopping item', onPressed: () => _editItem(context, wedding), icon: const Icon(Icons.add)),
            child: StreamBuilder<List<ShoppingItem>>(
              stream: repo.watchShopping(wedding.id),
              builder: (context, snapshot) {
                final all = snapshot.data ?? const <ShoppingItem>[];
                final items = all.where((item) => item.category == _category).toList();
                final purchased = all.where((item) => item.isPurchased).length;
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('$purchased / ${all.length} items purchased', style: const TextStyle(fontWeight: FontWeight.w700, color: WedlyColors.plum)),
                  const SizedBox(height: 12),
                  Wrap(spacing: 7, children: [
                    for (final category in categories)
                      ChoiceChip(label: Text(_title(category)), selected: _category == category, onSelected: (_) => setState(() => _category = category)),
                  ]),
                  const SizedBox(height: 14),
                  if (all.isEmpty)
                    EmptyState(icon: Icons.shopping_bag_outlined, message: 'Your shopping list is empty.', buttonText: 'Add Item', onPressed: () => _editItem(context, wedding))
                  else if (items.isEmpty)
                    EmptyState(icon: Icons.shopping_bag_outlined, message: 'Nothing in this category yet.', buttonText: 'Add Item', onPressed: () => _editItem(context, wedding))
                  else
                    for (final item in items)
                      Padding(padding: const EdgeInsets.only(bottom: 8), child: Card(child: ListTile(
                        leading: Checkbox(value: item.isPurchased, semanticLabel: 'Mark ${item.name} ${item.isPurchased ? 'needed' : 'purchased'}', onChanged: (value) => repo.toggleShoppingItem(item.id, value ?? false)),
                        title: Text(item.name, style: TextStyle(decoration: item.isPurchased ? TextDecoration.lineThrough : null)),
                        trailing: PopupMenuButton<String>(
                          onSelected: (action) async {
                            if (action == 'edit') await _editItem(context, wedding, item: item);
                            else if (await confirmDelete(context, item: 'this shopping item')) {
                              await repo.deleteShoppingItem(item.id);
                              if (context.mounted) showMessage(context, 'Shopping item deleted.');
                            }
                          },
                          itemBuilder: (_) => const [PopupMenuItem(value: 'edit', child: Text('Edit')), PopupMenuItem(value: 'delete', child: Text('Delete'))],
                        ),
                      ))),
                ]);
              },
            ),
          );
        },
      );

  Future<void> _editItem(BuildContext context, Wedding wedding, {ShoppingItem? item}) async {
    final name = TextEditingController(text: item?.name ?? '');
    var category = item?.category ?? _category;
    final form = GlobalKey<FormState>();
    final saved = await showDialog<bool>(context: context, builder: (context) => StatefulBuilder(builder: (context, setState) => AlertDialog(
      title: Text(item == null ? 'Add shopping item' : 'Edit shopping item'),
      content: Form(key: form, child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(controller: name, validator: (v) => v == null || v.trim().isEmpty ? 'Enter an item name.' : null, decoration: const InputDecoration(labelText: 'Item name')),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(initialValue: category, decoration: const InputDecoration(labelText: 'Category'), items: [for (final value in categories) DropdownMenuItem(value: value, child: Text(_title(value)))], onChanged: (value) => setState(() => category = value ?? category)),
      ])),
      actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')), FilledButton(onPressed: () { if (form.currentState!.validate()) Navigator.pop(context, true); }, child: const Text('Save'))],
    )));
    if (saved == true) await ref.read(repositoryProvider).saveShoppingItem(id: item?.id, weddingId: wedding.id, name: name.text, category: category);
    name.dispose();
  }
}

class _SmallPill extends StatelessWidget {
  const _SmallPill({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(color: WedlyColors.blush.withValues(alpha: .55), borderRadius: BorderRadius.circular(30)),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), child: Text(label, style: const TextStyle(fontSize: 12, color: WedlyColors.plum))),
      );
}

String _title(String value) => value[0].toUpperCase() + value.substring(1);
