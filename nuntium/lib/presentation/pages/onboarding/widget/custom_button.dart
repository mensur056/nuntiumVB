import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColors.primaryColors,
        borderRadius: 12.borderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: 12.borderRadius,
        child: Padding(
          padding: 20.allP,
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
