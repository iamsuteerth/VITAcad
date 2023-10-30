import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:vit_gpa_calc/screens/add_course.dart';
import 'package:vit_gpa_calc/screens/add_semester.dart';

class CgpaScreenAddButton extends StatelessWidget {
  const CgpaScreenAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const AddSemesterScreen(),
            );
          },
          label: 'Add semester',
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.book),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const AddCourseScreen(
                  isSemester: true,
                );
              },
            );
          },
          label: 'Add Course',
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
