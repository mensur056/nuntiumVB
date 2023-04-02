import 'package:flutter/material.dart';
import 'package:nuntium/presentation/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: SplashPage(),
    );
  }
}
