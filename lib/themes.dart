import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/constants/colors_constant.dart';

final ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 28, color: ConstantsColors.primary),
    headlineMedium: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 22, color: ConstantsColors.primary),
    headlineSmall: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 18, color: ConstantsColors.primary),
    bodyLarge: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 16.0, height: 1.5),
    bodyMedium: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 14.0, height: 1.5),
    bodySmall: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 12.0, height: 1.5),
  ),
  colorScheme: const ColorScheme(
    background: ConstantsColors.white,
    brightness: Brightness.light,
    primary: ConstantsColors.primary,
    secondary: ConstantsColors.primary,
    onPrimary: ConstantsColors.background,
    onSecondary: ConstantsColors.background,
    surface: ConstantsColors.white,
    onSurface: ConstantsColors.white,
    onError: ConstantsColors.background,
    onBackground: ConstantsColors.background,
    error: ConstantsColors.required,
  ),
);

final ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 28, color: ConstantsColors.primary),
    headlineMedium: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 22, color: ConstantsColors.primary),
    headlineSmall: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 18, color: ConstantsColors.primary),
    bodyLarge: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 16.0, height: 1.5),
    bodyMedium: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 14.0, height: 1.5),
    bodySmall: const TextStyle(color: ConstantsColors.readerTextDark, fontFamily: 'OpenSans', fontSize: 12.0, height: 1.5),
  ),
  colorScheme: const ColorScheme(
    background: ConstantsColors.background,
    brightness: Brightness.dark,
    primary: ConstantsColors.primary,
    secondary: ConstantsColors.primary,
    onPrimary: ConstantsColors.background,
    onSecondary: ConstantsColors.background,
    surface: ConstantsColors.background,
    onSurface: ConstantsColors.background,
    onError: ConstantsColors.background,
    onBackground: ConstantsColors.background,
    error: ConstantsColors.required,
  ),
);
