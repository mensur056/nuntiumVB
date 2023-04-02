import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/presentation/pages/home/home_page.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(1);

  void nextButtonMethod(BuildContext context) {
    emit(state + 1);
    if (state == 4) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }
}
