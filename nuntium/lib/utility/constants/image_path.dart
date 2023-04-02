enum OnBoardingImagePath { onboarding1, onboarding2, onboarding3 }

extension OnBoardingImagePathExtension on OnBoardingImagePath {
  String toPath() {
    return 'assets/images/im_$name.png';
  }
}

enum WelcomeImagePath { welcome }

extension WelcomeImagePathExtension on WelcomeImagePath {
  String toPath() {
    return 'assets/images/im_$name.png';
  }
}
