import 'package:flutter/material.dart';
import 'package:nuntium/utility/constants/image_path.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: PageView(
            clipBehavior: Clip.none,
            children: [
              Image.asset(ImagePath.onboarding2.toPath()),
              Image.asset(ImagePath.onboarding1.toPath()),
              Image.asset(ImagePath.onboarding3.toPath()),
            ],
          ),
        ),
        const Text("First To Know"),
        const Text("First To Know")
      ],
    ));
  }
}
