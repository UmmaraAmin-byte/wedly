class GeneratedEvent {
  const GeneratedEvent({
    required this.key,
    required this.name,
    required this.vendorCategories,
    required this.checklist,
    required this.tasks,
  });

  final String key;
  final String name;
  final List<String> vendorCategories;
  final List<String> checklist;
  final List<String> tasks;
}

class GeneratedTask {
  const GeneratedTask(this.key, this.name, {this.eventKey});
  final String key;
  final String name;
  final String? eventKey;
}

class GeneratedBudgetCategory {
  const GeneratedBudgetCategory(this.name, this.estimate);
  final String name;
  final int estimate;
}

class GeneratedPlan {
  const GeneratedPlan({
    required this.events,
    required this.vendorCategories,
    required this.shoppingItems,
    required this.tasks,
    required this.budgetCategories,
  });

  final List<GeneratedEvent> events;
  final List<String> vendorCategories;
  final List<(String category, String name)> shoppingItems;
  final List<GeneratedTask> tasks;
  final List<GeneratedBudgetCategory> budgetCategories;
}

class PlanEngine {
  static const commonTasks = <String>[
    'Finalize guest list',
    'Fix wedding budget',
    'Book main venue',
    'Order invitation cards',
    'Confirm RSVPs',
    'Plan wedding-day schedule',
    'Collect family contact details',
    'Confirm outfit measurements',
    'Arrange accommodation for guests',
    'Prepare day-of essentials',
    'Share final timings with family',
    'Review all vendor arrangements',
  ];

  static const shoppingCategories = <String>[
    'Bride',
    'Groom',
    'Events',
    'Gifts',
    'Other',
  ];

  static const shoppingStarters = <String, List<String>>{
    'Bride': ['Wedding outfit accessories', 'Jewellery essentials', 'Comfortable footwear'],
    'Groom': ['Wedding outfit accessories', 'Traditional footwear', 'Grooming essentials'],
    'Events': ['Decorative favors', 'Guest welcome items', 'Event-day supplies'],
    'Gifts': ['Family gifts', 'Wedding favors', 'Gift wrapping'],
    'Other': ['Document folder', 'Emergency sewing kit', 'Travel essentials'],
  };

  static GeneratedPlan generate({
    required List<String> eventKeys,
    required Map<String, dynamic> eventTemplates,
    required Map<String, dynamic> cityTemplates,
    required String city,
    required int totalBudget,
  }) {
    if (eventKeys.isEmpty) throw ArgumentError('Select at least one event.');
    final templates = <GeneratedEvent>[];
    final vendorNames = <String>{};
    final tasks = <GeneratedTask>[
      for (var i = 0; i < commonTasks.length; i++)
        GeneratedTask('common_${i + 1}', commonTasks[i]),
    ];

    for (final key in eventKeys) {
      final raw = eventTemplates[key];
      if (raw is! Map<String, dynamic>) {
        throw ArgumentError('Missing template for $key.');
      }
      final name = raw['name'] as String;
      final vendors = (raw['vendors'] as List<dynamic>).cast<String>();
      final checklist = (raw['checklist'] as List<dynamic>).cast<String>();
      final eventTasks = (raw['tasks'] as List<dynamic>).cast<String>();
      if (checklist.length < 8 || checklist.length > 12) {
        throw StateError('$name must have 8–12 checklist items.');
      }
      vendorNames.addAll(vendors);
      templates.add(GeneratedEvent(
        key: key,
        name: name,
        vendorCategories: vendors,
        checklist: checklist,
        tasks: eventTasks,
      ));
      for (var i = 0; i < eventTasks.length; i++) {
        tasks.add(GeneratedTask('${key}_task_${i + 1}', eventTasks[i], eventKey: key));
      }
    }

    final cityTemplate = cityTemplates[city];
    if (cityTemplate is! Map<String, dynamic>) {
      throw ArgumentError('City is not available yet.');
    }
    final split = cityTemplate['budgetSplits'] as Map<String, dynamic>;
    final budgetCategories = <GeneratedBudgetCategory>[];
    for (final entry in split.entries) {
      budgetCategories.add(GeneratedBudgetCategory(
        entry.key,
        (totalBudget * (entry.value as num) / 100).round(),
      ));
    }

    final uniqueNames = <String>{};
    final uniqueTasks = tasks.where((task) => uniqueNames.add(task.name)).toList();
    return GeneratedPlan(
      events: templates,
      vendorCategories: vendorNames.toList()..sort(),
      shoppingItems: [
        for (final category in shoppingCategories)
          for (final item in shoppingStarters[category]!) (category, item),
      ],
      tasks: uniqueTasks,
      budgetCategories: budgetCategories,
    );
  }
}
