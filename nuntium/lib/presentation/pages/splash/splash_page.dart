import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/bloc/auth/auth_state.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../bloc/sign_in/sign_in_cubit.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/constants/icon_path.dart';
import '../home/home_page.dart';
import '../sign_in/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColors,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthInitial()) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(IconPath.logoPath.toPng),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Nuntium")
                ],
              ),
            );
          } else if (state == AuthSuccess()) {
            return const HomePage();
          } else {
            return BlocProvider<SignInCubit>(
              create: (context) => SignInCubit(context.read<IAuthRepository>()),
              child: SignInPage(),
            );
          }
        },
      ),
    );
  }
}
