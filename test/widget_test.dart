import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedly/app/theme.dart';
import 'package:wedly/features/onboarding/onboarding_screens.dart';

void main() {
  testWidgets('Welcome screen presents the wedding planner entry point', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: buildWedlyTheme(), home: const WelcomeScreen()),
    );
    expect(
      find.text('Your wedding plan, generated in minutes.'),
      findsOneWidget,
    );
    expect(find.text('Create My Wedding'), findsOneWidget);
    expect(
      find.text('Private by design · Your plan stays on this device'),
      findsOneWidget,
    );
  });
}
