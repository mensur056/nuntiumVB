import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grock/grock.dart';
import '../../bloc/sign_up/sign_up_cubit.dart';
import '../../data/contractors/i_auth_repository.dart';
import '../../data/repositories/impl_auth_repository.dart';
import '../pages/sign_up/sign_up_page.dart';

class CustomNavigationTextBar extends StatelessWidget {
  const CustomNavigationTextBar({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.verticalP,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextButton(
              onPressed:onPressed,
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
