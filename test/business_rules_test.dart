import 'package:flutter_test/flutter_test.dart';
import 'package:wedly/core/utils/formatters.dart';
import 'package:wedly/core/utils/validators.dart';

void main() {
  group('wedding planning rules', () {
    test('payment and budget balances preserve negative values', () {
      expect(remainingVendorPayment(620000, 300000), 320000);
      expect(remainingBudget(2000000, 2100000), -100000);
      expect(isCategoryOverspent(600000, 620000), isTrue);
      expect(isCategoryOverspent(600000, 600000), isFalse);
    });

    test('progress handles empty lists and combines checklists with tasks', () {
      expect(eventProgress(0, 0), 0);
      expect(shoppingProgress(0, 0), 0);
      expect(
        overallProgress(
          doneChecklist: 0,
          totalChecklist: 0,
          doneTasks: 0,
          totalTasks: 0,
        ),
        0,
      );
      expect(
        overallProgress(
          doneChecklist: 4,
          totalChecklist: 8,
          doneTasks: 2,
          totalTasks: 4,
        ),
        0.5,
      );
    });

    test('countdown is day-based and handles today and past dates', () {
      final today = DateTime(2026, 10, 27);
      expect(countdownDays(today, today: today), 0);
      expect(countdownDays(DateTime(2026, 10, 26), today: today), -1);
      expect(countdownDays(DateTime(2026, 10, 29), today: today), 2);
    });

    test('guest totals are split by RSVP status', () {
      expect(
        guestTotalsByRsvp([('confirmed', 3), ('pending', 2), ('declined', 1)]),
        {'confirmed': 3, 'pending': 2, 'declined': 1},
      );
    });
  });

  group('form validation messages', () {
    test('required wedding fields return the exact messages', () {
      expect(validateWeddingName(' '), 'Please enter a wedding name.');
      expect(validateWeddingDate(null), 'Please enter a valid wedding date.');
      expect(validateGuestCount('0'), 'Guest count must be 1 or more.');
      expect(validateGuestCount('abc'), 'Guest count must be 1 or more.');
      expect(validateBudget('-1'), 'Budget cannot be negative.');
      expect(validateBudget('abc'), 'Budget cannot be negative.');
      expect(validateTaskName(''), 'Please enter a task name.');
      expect(validateEventSelection(0), 'Select at least one event.');
    });

    test('valid values pass without an error', () {
      expect(validateWeddingName('Faiqa & Jibran'), isNull);
      expect(validateWeddingDate(DateTime(2027, 1, 1)), isNull);
      expect(validateGuestCount('250'), isNull);
      expect(validateBudget('2000000'), isNull);
      expect(validateTaskName('Finalize guest list'), isNull);
      expect(validateEventSelection(1), isNull);
      expect(validateVendorAdvance(100, 100), isNull);
      expect(
        validateVendorAdvance(100, 101),
        'Advance cannot be greater than price.',
      );
    });
  });
}
