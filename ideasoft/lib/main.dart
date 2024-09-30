import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/navigation.dart';
import 'core/navigation/router.dart';
import 'core/theme/core/theme_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeManager()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainRouter.startApp(),
      navigatorKey: Navigation.navigatorKey,
    );
  }
}
