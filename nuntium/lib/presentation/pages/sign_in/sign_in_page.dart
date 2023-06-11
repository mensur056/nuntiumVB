import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/bloc/sign_up/sign_up_cubit.dart';
import 'package:nuntium/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../bloc/sign_in/sign_in_cubit.dart';
import '../../../bloc/sign_in/sign_in_state.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../../../utility/constants/icon_path.dart';
import '../../dialogs/failure_dialogs.dart';
import '../../global/custom_button.dart';
import '../../global/custom_navigation_text_bar.dart';
import '../../global/custom_text_description.dart';
import '../../global/custom_text_field.dart';
import '../../global/custom_text_title.dart';
import 'widgets/social_media_sign_in.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: _body(context),
      bottomNavigationBar: CustomNavigationTextBar(
          buttonText: localization.signUp,
          text: localization.haveAccount,
          onPressed: () {
            context.navigateToPage(BlocProvider(
              create: (context) => SignUpCubit(
                context.read<IAuthRepository>(),
              ),
              child: SignUpPage(),
            ));
          }),
    );
  }

  BlocConsumer<SignInCubit, SignInState> _body(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
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
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextTitle(title: localization.welcome),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextDescription(
                      textAlign: TextAlign.start, title: localization.description),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      title: localization.hintTextEmail,
                      iconPath: SignInIcon.email.toPath(),
                      controller: emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_outlined),
                    ),
                    iconPath: SignInIcon.locked.toPath(),
                    title: localization.hintTextPassword,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        localization.forgotPassword,
                        style: GoogleFonts.nunito(
                            color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: localization.buttonText,
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
                      title: localization.googleSignIn),
                  const SizedBox(
                    height: 20,
                  ),
                  SocialMediaSignInButton(
                      onTap: () {},
                      iconPath: SignInIcon.facebook.toPath(),
                      title: localization.facebookSignIn),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
