import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/strings.dart';

import '../../global/custom_text_title.dart';
import 'home_page.dart';
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
      bottomNavigationBar: const CustomNavigationBar(),
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
            _sizedBoxH24(),
            const ProfileImageField(),
            _sizedBoxH24(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.notification,
              trailing: const Icon(Icons.add),
            ),
            _sizedBoxH8(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.language,
              trailing: const Icon(Icons.add),
            ),
            _sizedBoxH8(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.changePass,
              trailing: const Icon(Icons.add),
            ),
            _sizedBoxH8(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.privacy,
              trailing: const Icon(Icons.add),
            ),
            _sizedBoxH8(),
            ProfileCategory(
              onPressed: () {},
              title: HomeProfile.termsCon,
              trailing: const Icon(Icons.add),
            ),
            _sizedBoxH8(),
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

  SizedBox _sizedBoxH24() {
    return const SizedBox(
      height: 24,
    );
  }

  SizedBox _sizedBoxH8() {
    return const SizedBox(
      height: 8,
    );
  }
}
