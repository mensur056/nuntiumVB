import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../bloc/onboarding.dart/onboarding_cubit.dart';
import '../../../utility/constants/image_path.dart';
import 'widget/custom_button.dart';
import 'widget/onboarding_image.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
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
            Expanded(
                flex: 2,
                child: Padding(
                  padding: 20.allP,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.grey.shade300,
                            activeDotColor: AppColors.primaryColors,
                            dotHeight: 16,
                            dotWidth: 16,
                          )),
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey.shade400),
                      ),
                      const Spacer(),
                      CustomButton(
                        title: (context.watch<OnboardingCubit>().state == 3) ? "Done" : "Next",
                        onTap: () {
                          context.read<OnboardingCubit>().nextButtonMethod(context);
                          controller.animateToPage(state,
                              duration: const Duration(seconds: 1), curve: Curves.linear);
                        },
                      )
                    ],
                  ),
                ))
          ],
        );
      },
    ));
  }
}