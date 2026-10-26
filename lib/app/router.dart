import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/dashboard_screen.dart';
import '../features/events/events_screens.dart';
import '../features/manage/manage_screens.dart';
import '../features/onboarding/onboarding_screens.dart';
import '../features/settings/settings_screen.dart';
import '../features/budget/budget_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const StartScreen()),
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/setup', builder: (context, state) => const WeddingSetupScreen()),
    GoRoute(path: '/select-events', builder: (context, state) => const SelectEventsScreen()),
    GoRoute(path: '/generated', builder: (context, state) => GeneratedScreen(summary: state.extra)),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/home', builder: (context, state) => const DashboardScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/plan',
            builder: (context, state) => const EventsScreen(),
            routes: [
              GoRoute(path: 'event/:id', builder: (context, state) => EventDetailScreen(eventId: int.parse(state.pathParameters['id']!))),
            ],
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/manage',
            builder: (context, state) => const ManagementScreen(),
            routes: [
              GoRoute(path: 'tasks', builder: (context, state) => const TasksScreen()),
              GoRoute(path: 'vendors-hub', builder: (context, state) => const VendorsHubScreen()),
              GoRoute(path: 'vendors/:id', builder: (context, state) => VendorListScreen(categoryId: int.parse(state.pathParameters['id']!))),
              GoRoute(path: 'guests', builder: (context, state) => const GuestsScreen()),
              GoRoute(path: 'shopping', builder: (context, state) => const ShoppingScreen()),
            ],
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/budget', builder: (context, state) => const BudgetScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(path: 'wedding', builder: (context, state) => const WeddingSetupScreen(isEditing: true)),
              GoRoute(path: 'events', builder: (context, state) => const EditEventsScreen()),
            ],
          ),
        ]),
      ],
    ),
  ],
);

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.event_note_outlined), selectedIcon: Icon(Icons.event_note), label: 'Plan'),
            NavigationDestination(icon: Icon(Icons.checklist_outlined), selectedIcon: Icon(Icons.checklist), label: 'Manage'),
            NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: 'Budget'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      );
}
