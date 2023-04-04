import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/sign_up/sign_up_cubit.dart';
import '../../data/contractors/i_auth_repository.dart';
import '../../data/repositories/impl_auth_repository.dart';
import '../pages/sign_up/sign_up_page.dart';

class CustomNavigationTextBar extends StatelessWidget {
  const CustomNavigationTextBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context).textTheme.bodySmall,
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
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
