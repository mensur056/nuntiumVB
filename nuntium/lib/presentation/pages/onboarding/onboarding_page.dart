import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView(),
          const Text('data'),
          const Text(''),
          ElevatedButton(onPressed: () {}, child: const Text('Next'))
        ],
      ),
    );
  }
}
