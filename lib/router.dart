import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/screens/home_screen.dart';
import 'package:vit_gpa_calc/screens/secondary_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case SecondaryScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SecondaryScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  }
}
