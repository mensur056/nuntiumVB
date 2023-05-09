import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:nuntium/utility/constants/strings.dart';

import '../../global/custom_text_title.dart';

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
          children: const [
            CustomTextTitle(title: HomeProfile.profile),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/im_onboarding1.png'),
              ),
              title: Text('Mansur Sarxanov'),
              subtitle: Text('mansur.sarxanov@gmail.com'),
            ),
            ListTile(),
          ],
        ),
      ),
    );
  }
}
