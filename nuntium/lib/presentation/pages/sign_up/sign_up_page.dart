import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/presentation/pages/sign_in/sign_in_page.dart';
import '../../../bloc/sign_in/sign_in_cubit.dart';
import '../../../bloc/sign_up/sign_up_cubit.dart';
import '../../../bloc/sign_up/sign_up_state.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../../../utility/constants/icon_path.dart';
import '../../../utility/constants/strings.dart';
import '../../dialogs/failure_dialogs.dart';
import '../../global/custom_button.dart';
import '../../global/custom_navigation_text_bar.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_field.dart';
import '../../global/custom_text_title.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomNavigationTextBar(
            buttonText: SignUpStrings.signIn,
            text: SignUpStrings.haveAccount,
            onPressed: () {
              Navigator.of(context).push(CircularClipRoute(
                transitionDuration: const Duration(seconds: 2),
                expandFrom: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => SignInCubit(
                      context.read<IAuthRepository>(),
                    ),
                    child: SignInPage(),
                  );
                },
              ));
            }),
        body: BlocConsumer<SignUpCubit, SignUpState>(
          buildWhen: (_, current) => current is! SignUpSuccess,
          listenWhen: (_, current) => current is SignUpFailure || current is SignUpSuccess,
          listener: (context, state) {
            if (state is SignUpFailure) {
              showDialog(
                context: context,
                builder: (context) {
                  return const FailureDialog();
                },
              );
            } else if (state is SignUpSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTextTitle(title: SignUpStrings.welcome),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextDescription(
                          textAlign: TextAlign.start, title: SignUpStrings.description),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          title: SignUpStrings.hintTextUsername,
                          iconPath: SignUpIcon.profile.toPath(),
                          controller: usernameController),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        iconPath: SignUpIcon.email.toPath(),
                        title: SignUpStrings.hintEmail,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        iconPath: SignUpIcon.locked.toPath(),
                        title: SignUpStrings.hintTextPassword,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                        iconPath: SignUpIcon.locked.toPath(),
                        title: SignUpStrings.hintRepeatPassword,
                        controller: repasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        title: SignUpStrings.buttonText,
                        onTap: () {
                          context
                              .read<SignUpCubit>()
                              .signUp(emailController.text, passwordController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
