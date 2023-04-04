import 'package:flutter/material.dart';

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall);
  }
}
