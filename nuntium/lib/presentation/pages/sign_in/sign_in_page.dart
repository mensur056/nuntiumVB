import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: BlocConsumer<SignInCubit, SignInState>(
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
                    if (state is! SignInInProgress)
                      ElevatedButton(
                        child: const Text("Log in"),
                        onPressed: () {
                          context
                              .read<SignInCubit>()
                              .signIn(emailController.text, passwordController.text);
                        },
                      )
                    else
                      const CircularProgressIndicator()
                  ],
                ));
          },
        ));
  }
}
