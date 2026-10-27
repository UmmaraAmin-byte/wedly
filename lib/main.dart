import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: WedlyApp()));
}

class WedlyApp extends StatelessWidget {
  const WedlyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Wedly',
    debugShowCheckedModeBanner: false,
    theme: buildWedlyTheme(),
    routerConfig: appRouter,
  );
}
