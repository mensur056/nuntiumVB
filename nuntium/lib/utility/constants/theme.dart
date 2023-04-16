import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuntium/utility/constants/colors.dart';

class AppTheme {
  final ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primaryColors),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.nunito(
        fontSize: 16,
        color: AppColors.chipPrimaryColor,
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 22,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 22,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.acme(
        fontSize: 22,
        color: Colors.grey,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 24,
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
