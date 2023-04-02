enum ImagePath { onboarding1, onboarding2, onboarding3 }

extension ImagePathExtension on ImagePath {
  String toPath() {
    return 'assets/images/im_$name.png';
  }
}
