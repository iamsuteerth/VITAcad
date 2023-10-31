import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/models/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  const CourseListItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Card(
        elevation: 0,
        color: Theme.of(context).focusColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
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
        // child: Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: Row(children: [
        //     Card(),
        //     Card(),
        //     Card(),
        //   ],),
        // ),
      ),
    );
  }
}
