import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuntium/utility/constants/colors.dart';

class AppTheme {
  final ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColors),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.acme(
        fontSize: 24,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.acme(
        fontSize: 24,
        color: Colors.grey,
      ),
      headlineMedium: GoogleFonts.acme(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.black,
      ),
    ),
  );
}
