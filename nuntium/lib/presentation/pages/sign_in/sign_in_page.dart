import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/presentation/global/custom_button.dart';
import 'package:nuntium/presentation/global/custom_text_description.dart';
import 'package:nuntium/utility/constants/icon_path.dart';

import '../../../bloc/sign_in/sign_in_cubit.dart';
import '../../../bloc/sign_in/sign_in_state.dart';
import '../../../bloc/sign_up/sign_up_cubit.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../../../data/repositories/impl_auth_repository.dart';
import '../../dialogs/failure_dialogs.dart';
import '../sign_up/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
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
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
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
                SocialMediaSignInButton(
                    iconPath: SignInIcon.google.toPath(), title: "Sign In With Google"),
                SocialMediaSignInButton(
                    iconPath: SignInIcon.facebook.toPath(), title: "Sign In With Facebook"),
                Row(
                  children: [
                    const CustomTextDescription(title: "Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return RepositoryProvider<IAuthRepository>(
                                create: (context) => ImplAuthRepository(),
                                child: BlocProvider<SignUpCubit>(
                                  create: (context) => SignUpCubit(context.read<IAuthRepository>()),
                                  child: SignUpPage(),
                                ),
                              );
                            },
                          ));
                        },
                        child: const Text('Sign Up')),
                  ],
                ),
              ],
            ));
      },
    );
  }
}

class SocialMediaSignInButton extends StatelessWidget {
  const SocialMediaSignInButton({super.key, required this.iconPath, required this.title});
  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(iconPath),
        title: Text(title),
      ),
    );
  }
}
