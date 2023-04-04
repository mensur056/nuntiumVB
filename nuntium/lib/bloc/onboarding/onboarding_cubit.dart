import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/presentation/pages/welcome/welcome_page.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(1);

  void nextButtonMethod(BuildContext context) {
    emit(state + 1);
    if (state == 4) {
      Navigator.of(context).push(CircularClipRoute(
        expandFrom: context,
        builder: (context) {
          return const WelcomePage();
        },
      ));
    }
  }
}
