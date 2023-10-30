import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vit_gpa_calc/theme/theme.dart';

class ThemeChangerButton extends ConsumerWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(themeMode.notifier).update(
          (state) {
            return state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          },
        );
      },
      icon: const Icon(
        Icons.sunny,
      ),
    );
  }
}
