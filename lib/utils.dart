import 'package:decimal/decimal.dart';
import 'package:vit_gpa_calc/models/course.dart';
import 'package:vit_gpa_calc/models/semester.dart';

class UtilityFunctions {
  static double calculateGPA(List<Course> courseList) {
    if (courseList.isEmpty) {
      return 0.0;
    }
    double numberOfCredits = 0;
    double gpaScore = 0;
    for (var i in courseList) {
      numberOfCredits += i.credits;
      gpaScore += i.courseGrade.val * i.credits;
    }
    return gpaScore / numberOfCredits;
  }

  static double calculateCGPA(
      List<Course> courseList, List<Semester> semesterList) {
    if (semesterList.isEmpty && courseList.isEmpty) {
      return 0.0;
    }
    double numberOfCredits = 0;
    double gpaScore = 0;
    for (var i in courseList) {
      numberOfCredits += i.credits;
      gpaScore += i.courseGrade.val * i.credits;
    }
    for (var i in semesterList) {
      numberOfCredits += i.credits;
      gpaScore += i.credits * i.gpa;
    }
    return double.parse((gpaScore / numberOfCredits).toStringAsFixed(2));
  }

  static double ceilTo2DecimalPlaces(double number) {
    final scaledNumber =
        (Decimal.parse(number.toString()) * Decimal.fromInt(100)).ceil() /
            Decimal.fromInt(100);
    return double.parse(scaledNumber.toDouble().toString());
  }
}
