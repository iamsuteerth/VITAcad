import 'package:flutter/material.dart';
import 'package:vit_gpa_calc/models/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  const CourseListItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 54,
                width: screenSize.width * 0.43,
                child: Card(
                  elevation: 8,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0, right: 2.0),
                          child: Icon(Icons.book),
                        ),
                        Flexible(
                          child: Text(
                            course.courseName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              SizedBox(
                height: 54,
                width: screenSize.width * 0.20,
                child: Card(
                  elevation: 8,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0, right: 2.0),
                          child: Icon(Icons.numbers_sharp),
                        ),
                        Flexible(
                          child: Text(
                            course.credits.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              SizedBox(
                height: 54,
                width: screenSize.width * 0.18,
                child: Card(
                  elevation: 8,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0, right: 2.0),
                          child: Icon(Icons.grade),
                        ),
                        Flexible(
                          child: Text(
                            course.courseGrade.grade,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
