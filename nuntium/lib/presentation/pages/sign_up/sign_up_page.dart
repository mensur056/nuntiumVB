import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sign_up/sign_up_cubit.dart';
import '../../../bloc/sign_up/sign_up_state.dart';
import '../../../utility/constants/strings.dart';
import '../../dialogs/failure_dialogs.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: SignUpStrings.hintTextUsername,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: SignUpStrings.hintTextPassword,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("Log in"),
                  onPressed: () {
                    context
                        .read<SignUpCubit>()
                        .signUp(emailController.text, passwordController.text);
                  },
                )
              ],
            );
          },
        ));
  }
}
