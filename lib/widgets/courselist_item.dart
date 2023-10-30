import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/models/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  const CourseListItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        contentPadding: const EdgeInsets.all(4),
        title: Text(
          course.courseName,
        ),
        subtitle: Row(
          children: [
            Text(
              course.credits.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              course.courseGrade.grade,
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
