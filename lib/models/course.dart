import 'package:vit_gpa_calc/models/grades.dart';

class Course {
  late String id;
  final double credits;
  final String courseName;
  final Grade courseGrade;
  Course({
    required this.credits,
    required this.courseName,
    required this.courseGrade,
    required this.id,
  });
}
