import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/models/semester.dart';

class SemesterListItem extends StatelessWidget {
  final Semester semester;
  const SemesterListItem({super.key, required this.semester});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.library_books_sharp),
        contentPadding: const EdgeInsets.all(4),
        title: Text(
          semester.name,
        ),
        subtitle: Row(
          children: [
            Text(
              semester.credits.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              semester.gpa.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
