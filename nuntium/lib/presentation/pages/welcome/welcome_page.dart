import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/image_path.dart';

import '../../global/custom_button.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_title.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            WelcomeImagePath.welcome.toPath(),
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
            child: Padding(
          padding: 20.allP,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextTitle(title: "Nuntium"),
              const CustomTextDescription(
                  title: 'All news in one place, be the first to know last news'),
              CustomButton(
                onTap: () {},
                title: "Get Started",
              )
            ],
          ),
        ))
      ],
    );
  }
}
