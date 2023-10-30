import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vit_gpa_calc/router.dart';
import 'package:vit_gpa_calc/screens/home_screen.dart';
import 'package:vit_gpa_calc/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => MaterialApp(
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: ref.watch(theme),
        darkTheme: ref.watch(darkTheme),
        themeMode: ref.watch(themeMode),
        home: const HomeScreen(),
      ),
    );
  }
}
