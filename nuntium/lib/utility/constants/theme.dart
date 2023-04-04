import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuntium/utility/constants/colors.dart';

class AppTheme {
  final ThemeData ligthTheme = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColors),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.acme(
        fontSize: 20,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.acme(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
      headlineLarge: GoogleFonts.acme(
        fontSize: 28,
        color: Colors.white,
      ),
    ),
  );
}
