import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuntium/utility/constants/colors.dart';

class AppTheme {
  final ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColors),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.acme(
        fontSize: 22,
        color: Colors.grey,
      ),
      headlineMedium: GoogleFonts.acme(
        fontSize: 28,
        color: Colors.white,
      ),
      headlineLarge: GoogleFonts.acme(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.black,
      ),
    ),
  );
}
