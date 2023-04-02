import 'package:flutter/material.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/constants/icon_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColors,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconPath.logoPath.toPng),
            const SizedBox(
              height: 20,
            ),
            const Text("Nuntium")
          ],
        ),
      ),
    );
  }
}
