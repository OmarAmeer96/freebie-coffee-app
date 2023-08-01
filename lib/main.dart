import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/get_started_screen.dart';
import 'package:freebie_coffee_app/screens/onboarding_screen.dart';
import 'package:freebie_coffee_app/screens/signin_screen.dart';
import 'package:freebie_coffee_app/screens/signup_screen.dart';
import 'package:freebie_coffee_app/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
