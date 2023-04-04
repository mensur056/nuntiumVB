import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/presentation/global/custom_button.dart';
import 'package:nuntium/presentation/global/custom_navigation_text_bar.dart';
import 'package:nuntium/presentation/global/custom_text_description.dart';
import 'package:nuntium/presentation/global/custom_text_title.dart';
import 'package:nuntium/utility/constants/icon_path.dart';

import '../../../bloc/sign_in/sign_in_cubit.dart';
import '../../../bloc/sign_in/sign_in_state.dart';
import '../../dialogs/failure_dialogs.dart';
import '../../global/custom_text_field.dart';
import 'widgets/social_media_sign_in.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: const CustomNavigationTextBar(),
    );
  }

  BlocConsumer<SignInCubit, SignInState> _body() {
    return BlocConsumer<SignInCubit, SignInState>(
      buildWhen: (_, current) => current is! SignInSuccess,
      listenWhen: (_, current) => current is SignInFailure || current is SignInSuccess,
      listener: (context, state) {
        if (state is SignInFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return const FailureDialog();
            },
          );
        } else if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextTitle(title: "Welcome Back 👋"),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextDescription(
                      textAlign: TextAlign.start,
                      title:
                          "I am happy to see you again. You can continue where you left off by logging in"),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      title: "Email Adress",
                      iconPath: SignInIcon.email.toPath(),
                      emailController: emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    iconPath: SignInIcon.locked.toPath(),
                    title: "Password",
                    emailController: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: "Sign In",
                    onTap: () {
                      context
                          .read<SignInCubit>()
                          .signIn(emailController.text, passwordController.text);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SocialMediaSignInButton(
                      onTap: () {},
                      iconPath: SignInIcon.google.toPath(),
                      title: "Sign In With Google"),
                  const SizedBox(
                    height: 20,
                  ),
                  SocialMediaSignInButton(
                      onTap: () {},
                      iconPath: SignInIcon.facebook.toPath(),
                      title: "Sign In With Facebook"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
