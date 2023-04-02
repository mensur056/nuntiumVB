import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.horizontalP,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
