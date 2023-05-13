import 'package:flutter/material.dart';

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
      color: AppColors.chipPrimaryColor,
      child: ListTile(
        onTap: onPressed,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        trailing: trailing,
      ),
    );
  }
}
