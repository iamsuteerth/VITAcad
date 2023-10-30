import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vit_gpa_calc/models/course.dart';
import 'package:vit_gpa_calc/models/credits.dart';
import 'package:vit_gpa_calc/models/grades.dart';
import 'package:vit_gpa_calc/screens/home_screen.dart';
import 'package:vit_gpa_calc/screens/secondary_screen.dart';

class AddCourseScreen extends ConsumerStatefulWidget {
  final bool isSemester;
  const AddCourseScreen({super.key, required this.isSemester});

  @override
  ConsumerState<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends ConsumerState<AddCourseScreen> {
  var courseName = '';
  var selectedCredits = 2.0;
  var selectedGrade = grades[Grades.S];
  final formKey = GlobalKey<FormState>();

  void resetForm() {
    formKey.currentState!.reset();
  }

  void saveItem(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (widget.isSemester) {
        ref.read(listGpaProviderCourses.notifier).update(
          (state) {
            state = [
              ...state,
              Course(
                credits: selectedCredits,
                courseName: courseName,
                courseGrade: selectedGrade!,
                id: const Uuid().v1(),
              )
            ];
            double creds = 0;
            for (var c in state) {
              creds += c.credits;
            }
            ref.read(cgpaCredits.notifier).update((state) => creds);
            return state;
          },
        );
      } else {
        ref.read(courseListForGpaProvider.notifier).update((state) {
          state = [
            ...state,
            Course(
              credits: selectedCredits,
              courseName: courseName,
              courseGrade: selectedGrade!,
              id: const Uuid().v1(),
            )
          ];
          double creds = 0;
          for (var c in state) {
            creds += c.credits;
          }
          ref.read(creditProvider.notifier).update((state) => creds);
          return state;
        });
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 15,
        left: 15,
        right: 15,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text(
                      'Course Name',
                    ),
                  ),
                  validator: (value) {
                    // Triggered to run a validation logic and return an error message if validation fails
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 2 ||
                        value.trim().length > 50) {
                      return 'Must be between 2 and 50 chars';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    courseName = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Credits',
                        ),
                        DropdownButtonFormField(
                          elevation: 8,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          value: selectedCredits,
                          items: [
                            for (final c in credits)
                              DropdownMenuItem(
                                value: c,
                                child: Text(
                                  c.toString()[2] == '0'
                                      ? c.toString()[0]
                                      : c.toString(),
                                ),
                              ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCredits = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Grade',
                        ),
                        DropdownButtonFormField(
                          elevation: 8,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          value: selectedGrade,
                          items: [
                            for (final grade in grades.entries)
                              DropdownMenuItem(
                                value: grade.value,
                                child: Text(grade.value.grade),
                              ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedGrade = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: resetForm,
                      icon: const Icon(Icons.restart_alt_sharp),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => saveItem(context),
                      child: const Text(
                        'Add Course',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
