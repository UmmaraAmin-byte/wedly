import 'package:flutter/material.dart';

import '../../app/theme.dart';

class PageFrame extends StatelessWidget {
  const PageFrame({
    super.key,
    required this.title,
    required this.child,
    this.action,
    this.bottomSpace = 28,
  });
  final String title;
  final Widget child;
  final Widget? action;
  final double bottomSpace;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      actions: action == null ? null : [action!],
    ),
    body: SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 8, 20, bottomSpace),
        child: child,
      ),
    ),
  );
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(padding: padding, child: child),
  );
}

class ProgressMeter extends StatelessWidget {
  const ProgressMeter({super.key, required this.value, this.label});
  final double value;
  final String? label;
  @override
  Widget build(BuildContext context) => Semantics(
    label: label ?? 'Progress',
    value: '${(value.clamp(0, 1) * 100).round()} percent',
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: LinearProgressIndicator(
        value: value.clamp(0, 1),
        minHeight: 9,
        backgroundColor: WedlyColors.blush,
        color: WedlyColors.rose,
      ),
    ),
  );
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });
  final IconData icon;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SectionCard(
    child: Column(
      children: [
        Icon(icon, size: 36, color: WedlyColors.rose),
        const SizedBox(height: 12),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        FilledButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    ),
  );
}

class ModuleTile extends StatelessWidget {
  const ModuleTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.tint = WedlyColors.blush,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color tint;
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: tint,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: WedlyColors.plum),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: WedlyColors.plum,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: WedlyColors.muted),
          ],
        ),
      ),
    ),
  );
}

Future<bool> confirmDelete(
  BuildContext context, {
  required String item,
}) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete $item?'),
        content: const Text('This can’t be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    ) ??
    false;

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
