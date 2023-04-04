import 'package:flutter/material.dart';

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({
    super.key,
    required this.title,
    this.textAlign = TextAlign.center,
  });
  final String title;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: textAlign, style: Theme.of(context).textTheme.headlineSmall);
  }
}
