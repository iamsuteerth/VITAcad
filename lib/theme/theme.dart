import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

final theme = Provider((ref) => ThemeClass.lightTheme);
final darkTheme = Provider((ref) => ThemeClass.darkTheme);
final themeMode = StateProvider((ref) => ThemeMode.light);

final appThemeProvider = StateProvider<bool>((ref) => false);

class ThemeClass {
  Color lightPrimaryColor = HexColor('#DF0054');
  Color darkPrimaryColor = HexColor('#C04E01');
  Color secondaryColor = HexColor('#FF8B6A');
  Color accentColor = HexColor('#FFD2BB');

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
      secondary: _themeClass.secondaryColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}

ThemeClass _themeClass = ThemeClass();
