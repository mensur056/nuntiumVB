import 'package:flutter/material.dart';

import '../../../constants/icon_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(IconPath.logoPath.toPng),
          ],
        ),
      ),
    );
  }
}
