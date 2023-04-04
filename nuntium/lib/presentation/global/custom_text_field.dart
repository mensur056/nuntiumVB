import 'package:flutter/material.dart';

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
          prefixIcon: Image.asset(iconPath),
          border: const OutlineInputBorder(),
          hintText: title,
          hintStyle: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
