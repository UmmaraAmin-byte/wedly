import 'package:intl/intl.dart';

final _money = NumberFormat('#,##0', 'en_US');
String formatPkr(num value) => 'PKR ${_money.format(value)}';
String formatDate(DateTime date) => DateFormat('d MMM yyyy').format(date);
int countdownDays(DateTime date, {DateTime? today}) {
  final now = today ?? DateTime.now();
  final start = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  return target.difference(start).inDays;
}

double progressRatio(int done, int total) => total == 0 ? 0 : done / total;
int guestTotal(Iterable<int> people) =>
    people.fold<int>(0, (sum, value) => sum + value);
int remainingVendorPayment(int price, int advance) => price - advance;
int remainingBudget(int total, int actual) => total - actual;
bool isCategoryOverspent(int estimated, int actual) => actual > estimated;
double eventProgress(int done, int total) => progressRatio(done, total);
double shoppingProgress(int purchased, int total) =>
    progressRatio(purchased, total);
double overallProgress({
  required int doneChecklist,
  required int totalChecklist,
  required int doneTasks,
  required int totalTasks,
}) => progressRatio(doneChecklist + doneTasks, totalChecklist + totalTasks);

Map<String, int> guestTotalsByRsvp(Iterable<(String rsvp, int people)> guests) {
  final totals = {'confirmed': 0, 'pending': 0, 'declined': 0};
  for (final guest in guests) {
    if (totals.containsKey(guest.$1)) {
      totals[guest.$1] = totals[guest.$1]! + guest.$2;
    }
  }
  return totals;
}
