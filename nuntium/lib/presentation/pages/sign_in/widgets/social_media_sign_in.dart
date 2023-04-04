import 'package:flutter/material.dart';

class SocialMediaSignInButton extends StatelessWidget {
  const SocialMediaSignInButton({super.key, required this.iconPath, required this.title});
  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(iconPath),
        title: Text(title),
      ),
    );
  }
}
