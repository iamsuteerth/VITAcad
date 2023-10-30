import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/screens/home_screen.dart';
import 'package:vit_gpa_calc/screens/secondary_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.arrow_forward_ios),
              title: const Text('GPA Calculator'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.arrow_forward_ios),
              title: const Text('CGPA Calculator'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SecondaryScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
