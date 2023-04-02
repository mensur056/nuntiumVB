import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
