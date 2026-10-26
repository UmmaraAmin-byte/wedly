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
int guestTotal(Iterable<int> people) => people.fold<int>(0, (sum, value) => sum + value);
