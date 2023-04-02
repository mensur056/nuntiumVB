import 'package:flutter/material.dart';
import 'package:nuntium/presentation/pages/home/home_page.dart';
import 'package:nuntium/presentation/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
