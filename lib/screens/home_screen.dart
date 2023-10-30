import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vit_gpa_calc/models/course.dart';
import 'package:vit_gpa_calc/screens/drawers/main_drawer.dart';
import 'package:vit_gpa_calc/utils.dart';
import 'package:vit_gpa_calc/screens/add_course.dart';
import 'package:vit_gpa_calc/widgets/courselist_item.dart';
import 'package:vit_gpa_calc/widgets/gpa_widget.dart';
import 'package:vit_gpa_calc/widgets/reset_app_state.dart';
import 'package:vit_gpa_calc/widgets/theme_changer.dart';

final courseListForGpaProvider = StateProvider<List<Course>>((ref) => []);
final creditProvider = StateProvider<double>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String routeName = 'GPA-CALC';

  void removeItem(WidgetRef ref, int index) {
    ref.read(courseListForGpaProvider.notifier).update((state) {
      state.removeAt(index);
      state = [...state];
      double creds = 0;
      for (var c in state) {
        creds += c.credits;
      }
      ref.read(creditProvider.notifier).update((state) => creds);
      return state;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseList = ref.watch(courseListForGpaProvider);
    var gpa = UtilityFunctions.ceilTo2DecimalPlaces(
      UtilityFunctions.calculateGPA(courseList),
    );
    var credits = ref.watch(creditProvider.notifier).state;
    return Scaffold(
      drawer: const MainDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'GPA Calculator${credits != 0 ? " - ${credits.toString()}" : ''}',
            softWrap: true,
          ),
        ),
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
          ResetAppState(isSemester: false),
          ThemeChangerButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const AddCourseScreen(
                isSemester: false,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.78,
            child: ListView.builder(
              itemCount: courseList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(courseList[index].id),
                  onDismissed: (direction) {
                    removeItem(ref, index);
                  },
                  child: CourseListItem(course: courseList[index]),
                );
              },
            ),
          ),
          const Spacer(),
          GpaWidget(gpa: gpa),
        ],
      ),
    );
  }
}
