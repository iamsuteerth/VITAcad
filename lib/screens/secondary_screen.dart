import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vit_gpa_calc/models/course.dart';
import 'package:vit_gpa_calc/models/semester.dart';
import 'package:vit_gpa_calc/screens/drawers/main_drawer.dart';
import 'package:vit_gpa_calc/utils.dart';
import 'package:vit_gpa_calc/widgets/cgpa_page_add_button.dart';
import 'package:vit_gpa_calc/widgets/courselist_item.dart';
import 'package:vit_gpa_calc/widgets/gpa_widget.dart';
import 'package:vit_gpa_calc/widgets/semesterlist_item.dart';
import 'package:vit_gpa_calc/widgets/theme_changer.dart';

final listGpaProviderSemesters = StateProvider<List<Semester>>((ref) => []);
final listGpaProviderCourses = StateProvider<List<Course>>((ref) => []);
final cgpaCredits = StateProvider<double>((ref) => 0.0);

class SecondaryScreen extends ConsumerWidget {
  const SecondaryScreen({super.key});
  static const String routeName = 'CGPA-CALC';

  void removeItem(WidgetRef ref, int index, Object obj) {
    if (obj is Semester) {
      ref.read(listGpaProviderSemesters.notifier).update((state) {
        state.removeAt(index);
        double creds = 0;
        for (var c in state) {
          creds += c.credits;
        }
        ref.read(cgpaCredits.notifier).update((state) => creds);
        return state;
      });
    }
    if (obj is Course) {
      ref.read(listGpaProviderCourses.notifier).update((state) {
        state.removeAt(index);
        double creds = 0;
        for (var c in state) {
          creds += c.credits;
        }
        ref.read(cgpaCredits.notifier).update((state) => creds);
        return state;
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseList = ref.watch(listGpaProviderCourses);
    final semesterList = ref.watch(listGpaProviderSemesters);
    var gpa = UtilityFunctions.ceilTo2DecimalPlaces(
      UtilityFunctions.calculateCGPA(courseList, semesterList),
    );
    final credits = ref.watch(cgpaCredits);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(
            'CGPA Calculator${credits != 0 ? " - ${credits.toString()}" : ''}'),
        centerTitle: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: const [
          ThemeChangerButton(),
        ],
      ),
      floatingActionButton: const CgpaScreenAddButton(),
      body: Column(
        children: [
          // Courses
          courseList.isNotEmpty
              ? Card(
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: ListView.builder(
                      itemCount: courseList.length,
                      itemBuilder: (context, index) {
                        var item = courseList[index];
                        return Dismissible(
                          key: ValueKey(item.id),
                          onDismissed: (direction) {
                            removeItem(ref, index, item);
                          },
                          child: CourseListItem(course: item),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 8,
          ),
          // Semesters
          semesterList.isNotEmpty
              ? Card(
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: ListView.builder(
                      itemCount: semesterList.length,
                      itemBuilder: (context, index) {
                        var item = semesterList[index];
                        return Dismissible(
                          key: ValueKey(item.id),
                          onDismissed: (direction) {
                            removeItem(ref, index, item);
                          },
                          child: SemesterListItem(semester: item),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.all(15),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GpaWidget(gpa: gpa),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
