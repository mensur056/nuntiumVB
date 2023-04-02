import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColors.primaryColors,
        borderRadius: 12.borderRadius,
      ),
      child: InkWell(
        borderRadius: 12.borderRadius,
        child: Padding(
          padding: 20.allP,
          child: Center(
              child: Text(
            "Next",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
