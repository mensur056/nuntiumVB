import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaSignInButton extends StatelessWidget {
  const SocialMediaSignInButton(
      {super.key, required this.iconPath, required this.title, required this.onTap});
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(iconPath),
        title: Text(
          title,
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
