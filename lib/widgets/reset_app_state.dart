import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vit_gpa_calc/screens/home_screen.dart';
import 'package:vit_gpa_calc/screens/secondary_screen.dart';

class ResetAppState extends ConsumerWidget {
  final bool isSemester;
  const ResetAppState({
    super.key,
    required this.isSemester,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        if (isSemester) {
          ref.read(listGpaProviderSemesters.notifier).update((state) => []);
          ref.read(listGpaProviderCourses.notifier).update((state) => []);
          ref.read(cgpaCredits.notifier).update((state) => 0.0);
        } else {
          ref.read(courseListForGpaProvider.notifier).update((state) => []);
          ref.read(creditProvider.notifier).update((state) => 0.0);
        }
      },
      icon: const Icon(Icons.delete),
    );
  }
}
