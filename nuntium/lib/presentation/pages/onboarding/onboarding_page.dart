import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utility/constants/image_path.dart';
import 'widget/custom_button.dart';
import 'widget/onboarding_image.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: 20.allP,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: context.mediaQuery.size.height * 0.5,
            child: PageView(
              controller: controller,
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
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
              ),
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
