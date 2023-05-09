import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class CustomNavigationTextBar extends StatelessWidget {
  const CustomNavigationTextBar({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.verticalP,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
