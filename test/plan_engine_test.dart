import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:wedly/features/plan_engine/plan_engine.dart';

void main() {
  final eventTemplates =
      jsonDecode(
            File('assets/templates/event_templates.json').readAsStringSync(),
          )
          as Map<String, dynamic>;
  final cityTemplates =
      jsonDecode(
            File('assets/templates/city_templates.json').readAsStringSync(),
          )
          as Map<String, dynamic>;

  test('Mehndi, Barat and Walima generate the required plan size', () {
    final plan = PlanEngine.generate(
      eventKeys: ['mehndi', 'barat', 'walima'],
      eventTemplates: eventTemplates,
      cityTemplates: cityTemplates,
      city: 'Islamabad',
      totalBudget: 2000000,
    );
    expect(plan.events, hasLength(3));
    expect(plan.vendorCategories, hasLength(7));
    expect(
      plan.vendorCategories,
      containsAll([
        'Decoration',
        'Catering',
        'Photography',
        'Venue',
        'Entertainment',
        'Transport',
        'Seating',
      ]),
    );
    expect(PlanEngine.shoppingCategories, hasLength(5));
    expect(plan.tasks, hasLength(18));
    expect(plan.budgetCategories, hasLength(6));
    expect(
      plan.budgetCategories.fold<int>(0, (sum, item) => sum + item.estimate),
      2000000,
    );
  });

  test(
    'shared vendor categories are represented once and linked by event templates',
    () {
      final plan = PlanEngine.generate(
        eventKeys: ['mehndi', 'barat', 'walima'],
        eventTemplates: eventTemplates,
        cityTemplates: cityTemplates,
        city: 'Islamabad',
        totalBudget: 2000000,
      );
      expect(
        plan.vendorCategories.where((name) => name == 'Catering'),
        hasLength(1),
      );
      expect(
        plan.events.where(
          (event) => event.vendorCategories.contains('Catering'),
        ),
        hasLength(3),
      );
    },
  );

  test('rejects an empty event selection and unsupported city', () {
    expect(
      () => PlanEngine.generate(
        eventKeys: [],
        eventTemplates: eventTemplates,
        cityTemplates: cityTemplates,
        city: 'Islamabad',
        totalBudget: 0,
      ),
      throwsArgumentError,
    );
    expect(
      () => PlanEngine.generate(
        eventKeys: ['mehndi'],
        eventTemplates: eventTemplates,
        cityTemplates: cityTemplates,
        city: 'Lahore',
        totalBudget: 0,
      ),
      throwsArgumentError,
    );
  });
}
