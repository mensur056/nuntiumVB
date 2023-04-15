import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.iconPath,
    this.onPressed,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String title;
  final Widget iconPath;
  final VoidCallback? onPressed;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: IconButton(onPressed: onPressed, icon: iconPath),
        suffixIcon: suffixIcon,
        hintText: title,
        hintStyle: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
        fillColor: AppColors.textFieldColor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
