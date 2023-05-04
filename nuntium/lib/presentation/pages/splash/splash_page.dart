import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/bloc/sign_up/sign_up_cubit.dart';
import '../../../bloc/auth/auth_cubit.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/constants/icon_path.dart';
import '../home/home_page.dart';
import '../sign_up/sign_up_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColors,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthState.initial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        IconSplash.nunlogo.toPath(),
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Nuntium'),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  )
                ],
              ),
            );
          } else if (state == AuthState.unauthenticated) {
            return BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(context.read<IAuthRepository>()),
              child: SignUpPage(),
            );
          } else {
            return const HomePage();
            // return const WelcomePage();
            // return BlocProvider<OnboardingCubit>(
            //   create: (context) => OnboardingCubit(),
            //   child: const OnboardingPage(),
            // );
            // return BlocProvider<SignInCubit>(
            //   create: (context) => SignInCubit(context.read<IAuthRepository>()),
            //   child: SignInPage(),
            // );
          }
        },
      ),
    );
  }
}
