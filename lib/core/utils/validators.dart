String? validateWeddingName(String? value) =>
    value == null || value.trim().isEmpty
    ? 'Please enter a wedding name.'
    : null;

String? validateWeddingDate(DateTime? value) =>
    value == null ? 'Please enter a valid wedding date.' : null;

String? validateGuestCount(String? value) {
  final count = int.tryParse(value ?? '');
  return count == null || count < 1 ? 'Guest count must be 1 or more.' : null;
}

String? validateBudget(String? value) {
  final amount = int.tryParse(value ?? '');
  return amount == null || amount < 0 ? 'Budget cannot be negative.' : null;
}

String? validateTaskName(String? value) =>
    value == null || value.trim().isEmpty ? 'Please enter a task name.' : null;

String? validateEventSelection(int count) =>
    count < 1 ? 'Select at least one event.' : null;

String? validateVendorAdvance(int? price, int? advance) {
  if (price == null || advance == null || price < 0 || advance < 0) {
    return 'Enter a valid price and advance.';
  }
  if (advance > price) return 'Advance cannot be greater than price.';
  return null;
}
