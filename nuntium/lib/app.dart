import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';
import 'package:nuntium/presentation/pages/home/home_page.dart';
import 'package:nuntium/presentation/pages/splash/splash_page.dart';

import 'bloc/auth/auth_cubit.dart';
import 'data/repositories/impl_auth_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAuthRepository>(
      create: (context) => ImplAuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(context.read<IAuthRepository>())..checkAuth(),
          )
        ],
        child: MaterialApp(
          title: 'Material App',
          home: const SplashPage(),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                );

              default:
            }
            return null;
          },
        ),
      ),
    );
  }
}
