import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.emailController,
    required this.title,
    required this.iconPath,
  });

  final TextEditingController emailController;
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
          prefixIcon: SizedBox(height: 50, width: 50, child: Image.asset(iconPath)),
          border: const OutlineInputBorder(),
          hintText: title,
          hintStyle: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400)),
    );
  }
}
