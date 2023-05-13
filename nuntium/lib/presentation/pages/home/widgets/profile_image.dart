import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileImageField extends StatelessWidget {
  const ProfileImageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: context.mediaQuery.size.width * 0.12,
        backgroundImage: const AssetImage('assets/images/im_onboarding1.png'),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mansur Sarxanov',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'mansur.sarxanov@gmail.com',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      )
    ]);
  }
}
