import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/get_started_screen.dart';
import 'package:freebie_coffee_app/screens/onboarding_screen.dart';
import 'package:freebie_coffee_app/screens/signin_screen.dart';
import 'package:freebie_coffee_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freebie Coffee App',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        GetStarted.id: (context) => const GetStarted(),
        OnBoarding.id: (context) => OnBoarding(),
        SigninScreen.id: (context) => const SigninScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
