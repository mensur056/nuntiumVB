import 'package:flutter/material.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Failure'),
      content: const Text('Please try again'),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Ok'))],
    );
  }
}

class SignUpFailureDialog extends StatelessWidget {
  const SignUpFailureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Failure'),
      content: const Text('This person is already have'),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Ok'))],
    );
  }
}
