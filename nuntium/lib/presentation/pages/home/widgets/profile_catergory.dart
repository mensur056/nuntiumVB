import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../../../../utility/constants/colors.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory({
    super.key,
    required this.title,
    required this.trailing,
    required this.onPressed,
  });
  final String title;
  final Widget trailing;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      color: AppColors.chipPrimaryColor,
      child: ListTile(
        onTap: onPressed,
        title: Padding(
          padding: 16.verticalP,
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
