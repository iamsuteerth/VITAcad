import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

final theme = Provider((ref) => ThemeClass.lightTheme);
final darkTheme = Provider((ref) => ThemeClass.darkTheme);
final themeMode = StateProvider((ref) => ThemeMode.light);

final appThemeProvider = StateProvider<bool>((ref) => false);

class ThemeClass {
  // Color lightPrimaryColor = HexColor('#DF0054');
  // Color darkPrimaryColor = HexColor('#C04E01');
  Color lightPrimaryColor = Colors.redAccent.shade700.withAlpha(255);
  Color darkPrimaryColor = Colors.redAccent.shade700.withAlpha(220);
  Color secondaryColor = HexColor('#D32F2F');
  Color accentColor = HexColor('#FF5252');

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      bodySmall: const TextStyle(color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black),
      titleMedium: const TextStyle(color: Colors.black),
      titleSmall: const TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.grey.shade600),
      labelMedium: TextStyle(color: Colors.grey.shade600),
      labelSmall: TextStyle(color: Colors.grey.shade600),
      displayLarge: const TextStyle(color: Colors.black),
      displayMedium: const TextStyle(color: Colors.black),
      displaySmall: const TextStyle(color: Colors.black),
      headlineLarge: const TextStyle(color: Colors.black),
      headlineMedium: const TextStyle(color: Colors.black),
      headlineSmall: const TextStyle(color: Colors.black),
    ),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
      secondary: _themeClass.secondaryColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white),
      bodySmall: const TextStyle(color: Colors.white),
      titleLarge: const TextStyle(color: Colors.white),
      titleMedium: const TextStyle(color: Colors.white),
      titleSmall: const TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.grey.shade300),
      labelMedium: TextStyle(color: Colors.grey.shade300),
      labelSmall: TextStyle(color: Colors.grey.shade300),
      displayLarge: const TextStyle(color: Colors.white),
      displayMedium: const TextStyle(color: Colors.white),
      displaySmall: const TextStyle(color: Colors.white),
      headlineLarge: const TextStyle(color: Colors.white),
      headlineMedium: const TextStyle(color: Colors.white),
      headlineSmall: const TextStyle(color: Colors.white),
    ),
    brightness: Brightness.dark,
  );
}

ThemeClass _themeClass = ThemeClass();
