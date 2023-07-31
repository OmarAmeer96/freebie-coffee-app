import 'package:flutter/material.dart';
import 'dart:ui'; // Import this for the ImageFilter

import '../widgets/custom_app_logo.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  static String id = 'SigninScreen';

  @override
  Widget build(BuildContext context) {
    // Define the color with the desired opacity
    const Color filterColor =
        Color(0x80110e0c); // Opacity set to 0.47 (0x77 is the alpha value)

    return Scaffold(
      backgroundColor: const Color(0xff55433c),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(filterColor, BlendMode.srcATop),
              child: Image.asset(
                "assets/images/coffee-beans-dark-background-top-view-coffee-concept-banner_1220-6300 1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                ),
                CustomAppLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
