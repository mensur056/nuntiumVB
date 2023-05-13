import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/strings.dart';

import '../../global/custom_text_title.dart';
import 'widgets/profile_catergory.dart';
import 'widgets/profile_image.dart';

class HomeProfilePage extends StatefulWidget {
  const HomeProfilePage({super.key});

  @override
  State<HomeProfilePage> createState() => _HomeProfilePageState();
}

class _HomeProfilePageState extends State<HomeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: 30.horizontalP,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextTitle(title: HomeProfile.profile),
            const SizedBox(
              height: 24,
            ),
            const ProfileImageField(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.notification,
              trailing: const Icon(Icons.add),
            ),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.language,
              trailing: const Icon(Icons.add),
            ),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.changePass,
              trailing: const Icon(Icons.add),
            ),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.privacy,
              trailing: const Icon(Icons.add),
            ),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.termsCon,
              trailing: const Icon(Icons.add),
            ),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.singOut,
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
