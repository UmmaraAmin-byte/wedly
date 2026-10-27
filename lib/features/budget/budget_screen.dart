import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/app_providers.dart';
import '../../core/db/app_database.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StreamBuilder<Wedding?>(
    stream: ref.watch(repositoryProvider).watchWedding(),
    builder: (context, weddingSnapshot) {
      final wedding = weddingSnapshot.data;
      if (wedding == null) {
        return PageFrame(
          title: 'Budget',
          child: EmptyState(
            icon: Icons.account_balance_wallet_outlined,
            message: 'No wedding yet.',
            buttonText: 'Create My Wedding',
            onPressed: () => context.go('/setup'),
          ),
        );
      }
      final repository = ref.watch(repositoryProvider);
      return PageFrame(
        title: 'Budget',
        action: IconButton(
          tooltip: 'Add budget category',
          onPressed: () => _editBudget(context, ref, wedding),
          icon: const Icon(Icons.add),
        ),
        child: StreamBuilder<List<BudgetItem>>(
          stream: repository.watchBudget(wedding.id),
          builder: (context, snapshot) {
            final items = snapshot.data ?? const <BudgetItem>[];
            final estimated = items.fold<int>(
              0,
              (sum, item) => sum + item.estimated,
            );
            final actual = items.fold<int>(0, (sum, item) => sum + item.actual);
            final remaining = wedding.totalBudget - actual;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total wedding budget',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatPkr(wedding.totalBudget),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _SummaryMetric(
                              label: 'Estimated',
                              amount: estimated,
                            ),
                          ),
                          Expanded(
                            child: _SummaryMetric(
                              label: 'Spent',
                              amount: actual,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: remaining < 0
                              ? const Color(0xFFFFE6E3)
                              : WedlyColors.sage,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              remaining < 0
                                  ? Icons.warning_amber_rounded
                                  : Icons.savings_outlined,
                              color: remaining < 0
                                  ? Colors.red.shade800
                                  : WedlyColors.plum,
                            ),
                            const SizedBox(width: 9),
                            Expanded(
                              child: Text(
                                remaining < 0
                                    ? 'Over budget by ${formatPkr(-remaining)}'
                                    : '${formatPkr(remaining)} remaining',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'By category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                if (items.isEmpty)
                  EmptyState(
                    icon: Icons.receipt_long_outlined,
                    message: 'Your budget hasn’t been set up yet.',
                    buttonText: 'Add Expense',
                    onPressed: () => _editBudget(context, ref, wedding),
                  )
                else
                  for (final item in items)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.categoryName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: WedlyColors.plum,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                if (item.actual > item.estimated)
                                  const Chip(
                                    avatar: Icon(
                                      Icons.warning_amber_rounded,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    label: Text('Over estimate'),
                                  )
                                else
                                  const Icon(
                                    Icons.check_circle_outline,
                                    color: WedlyColors.rose,
                                  ),
                                PopupMenuButton<String>(
                                  tooltip: 'Budget category actions',
                                  onSelected: (action) async {
                                    if (action == 'edit') {
                                      await _editBudget(
                                        context,
                                        ref,
                                        wedding,
                                        item: item,
                                      );
                                    } else if (await confirmDelete(
                                      context,
                                      item: 'this budget category',
                                    )) {
                                      await repository.deleteBudgetItem(
                                        item.id,
                                      );
                                      if (context.mounted) {
                                        showMessage(
                                          context,
                                          'Budget category deleted.',
                                        );
                                      }
                                    }
                                  },
                                  itemBuilder: (_) => const [
                                    PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              'Estimated ${formatPkr(item.estimated)}  ·  Actual ${formatPkr(item.actual)}',
                            ),
                            if (item.notes?.isNotEmpty == true) ...[
                              const SizedBox(height: 6),
                              Text(item.notes!),
                            ],
                          ],
                        ),
                      ),
                    ),
              ],
            );
          },
        ),
      );
    },
  );
}

Future<void> _editBudget(
  BuildContext context,
  WidgetRef ref,
  Wedding wedding, {
  BudgetItem? item,
}) async {
  final category = TextEditingController(text: item?.categoryName ?? '');
  final estimate = TextEditingController(
    text: item == null ? '' : '${item.estimated}',
  );
  final actual = TextEditingController(
    text: item == null ? '0' : '${item.actual}',
  );
  final notes = TextEditingController(text: item?.notes ?? '');
  final form = GlobalKey<FormState>();
  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        item == null ? 'Add budget category' : 'Edit budget category',
      ),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: category,
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'Enter a category name.'
                      : null,
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: estimate,
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      int.tryParse(v ?? '') == null || int.parse(v!) < 0
                      ? 'Enter a valid estimate.'
                      : null,
                  decoration: const InputDecoration(
                    labelText: 'Estimated amount',
                    prefixText: 'PKR ',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: actual,
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      int.tryParse(v ?? '') == null || int.parse(v!) < 0
                      ? 'Enter a valid actual amount.'
                      : null,
                  decoration: const InputDecoration(
                    labelText: 'Actual spent',
                    prefixText: 'PKR ',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: notes,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Notes'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (form.currentState!.validate()) Navigator.pop(context, true);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
  if (saved == true) {
    await ref
        .read(repositoryProvider)
        .saveBudgetItem(
          id: item?.id,
          weddingId: wedding.id,
          category: category.text,
          estimate: int.parse(estimate.text),
          actual: int.parse(actual.text),
          notes: notes.text,
        );
  }
  category.dispose();
  estimate.dispose();
  actual.dispose();
  notes.dispose();
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({required this.label, required this.amount});
  final String label;
  final int amount;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 3),
      Text(
        formatPkr(amount),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: WedlyColors.plum,
        ),
      ),
    ],
  );
}
