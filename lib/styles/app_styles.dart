import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const double borderRadius = 15.0;

  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.amber,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    textTheme: TextTheme(
      headlineSmall: GoogleFonts.unicaOne(),
      headlineMedium: GoogleFonts.unicaOne(),
      headlineLarge: GoogleFonts.unicaOne(),
      titleSmall: GoogleFonts.unicaOne(),
      titleMedium: GoogleFonts.unicaOne(),
      titleLarge: GoogleFonts.unicaOne(),
      bodySmall: GoogleFonts.syne(),
      bodyMedium: GoogleFonts.syne(),
      bodyLarge: GoogleFonts.syne(),
      labelSmall: GoogleFonts.syne(),
      labelMedium: GoogleFonts.syne(),
      labelLarge: GoogleFonts.syne()
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
  );
}