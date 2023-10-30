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
            const SizedBox(
              height: 15,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.book_sharp),
              title: const Text(
                'GPA Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            const Divider(
              indent: 60,
              thickness: 1,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.library_books_sharp),
              title: const Text(
                'CGPA Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SecondaryScreen.routeName);
              },
            ),
            const Divider(
              indent: 60,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
