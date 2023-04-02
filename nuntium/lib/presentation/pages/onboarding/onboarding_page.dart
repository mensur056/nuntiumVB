import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../../../utility/constants/image_path.dart';
import 'widget/custom_button.dart';
import 'widget/onboarding_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: 30.allP,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: context.mediaQuery.size.height * 0.5,
            child: PageView(
              children: [
                OnboardingImage(
                  image: ImagePath.onboarding2.toPath(),
                ),
                OnboardingImage(
                  image: ImagePath.onboarding1.toPath(),
                ),
                OnboardingImage(
                  image: ImagePath.onboarding3.toPath(),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "First To Know",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            textAlign: TextAlign.center,
            "All news in one place, be the first to know last news",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          const CustomButton()
        ],
      ),
    ));
  }
}
