import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static final TextTheme defaultTextTheme = GoogleFonts.robotoTextTheme().copyWith(
    displayLarge: GoogleFonts.roboto(fontSize: 57, fontWeight: FontWeight.bold, letterSpacing: -0.5),
    displayMedium: GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w600),
    headlineLarge: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    bodySmall: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelLarge: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    labelMedium: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    labelSmall: GoogleFonts.roboto(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
  );
}
