import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vit_gpa_calc/models/semester.dart';
import 'package:vit_gpa_calc/screens/secondary_screen.dart';

class AddSemesterScreen extends ConsumerStatefulWidget {
  const AddSemesterScreen({super.key});

  @override
  ConsumerState<AddSemesterScreen> createState() => _AddSemesterScreenState();
}

class _AddSemesterScreenState extends ConsumerState<AddSemesterScreen> {
  var semesterName = '';
  var credits = 2.0;
  var gpa = 0.0;
  final formKey = GlobalKey<FormState>();

  void resetForm() {
    formKey.currentState!.reset();
  }

  void saveItem(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ref.read(listGpaProviderSemesters.notifier).update((state) {
        state = [
          ...state,
          Semester(
            id: const Uuid().v1(),
            name: semesterName,
            credits: credits,
            gpa: gpa,
          ),
        ];

        ref.read(cgpaCredits.notifier).update((state) => state + credits);
        return state;
      });
      Navigator.of(context).pop();
    }
  }

  bool hasExactlyOneDecimalPoint(String input) {
    int count = input.split('.').length - 1;
    return count == 1;
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
                    label: Text('Semester Name'),
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
                    semesterName = value!;
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
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Credits'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            double.tryParse(value) == null ||
                            double.tryParse(value)! <= 0 ||
                            double.tryParse(value)! > 200) {
                          return 'Invalid credits entered';
                        }
                        var parsedValue = double.parse(value).toString();
                        if (hasExactlyOneDecimalPoint(parsedValue)) {
                          String charAfterDot = 'X';
                          for (int i = 0; i < parsedValue.length; i++) {
                            if (parsedValue[i] == '.') {
                              charAfterDot = parsedValue[i + 1];
                            }
                          }
                          switch (charAfterDot) {
                            case '0':
                              return null;
                            case '5':
                              return null;
                            default:
                              return 'Invalid credits entered';
                          }
                        } else {
                          return '1 decimal only';
                        }
                      },
                      onSaved: (value) {
                        credits = double.parse(value!);
                      },
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('GPA'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            double.tryParse(value) == null ||
                            double.tryParse(value)! <= 0 ||
                            double.tryParse(value)! > 10.0) {
                          return 'Invalid GPA range';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        gpa = double.parse(value!);
                      },
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
                        'Add Semester',
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
