import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/signup_screen.dart';
import 'package:freebie_coffee_app/widgets/custom_email_textfiled.dart';
import 'package:freebie_coffee_app/widgets/custom_password_textfield.dart';
import 'package:freebie_coffee_app/widgets/signin_up_button.dart';
import 'dart:ui';
import '../widgets/custom_app_logo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String id = 'SignInScreen';

  @override
  Widget build(BuildContext context) {
    const Color filterColor = Color(0x80110e0c);

    return Scaffold(
      backgroundColor: const Color(0xff55433c),
      body: SingleChildScrollView(
        child: Stack(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const CustomAppLogo(),
                  const SizedBox(
                    height: 75,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 49,
                      letterSpacing: 0.5,
                      fontFamily: 'Gilroy-Bold',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We’ve already met!",
                    style: TextStyle(
                      color: Color(0xffbbb9b8),
                      fontSize: 18,
                      letterSpacing: 0.5,
                      fontFamily: 'Gilroy-Medium',
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  // const CustomEmailTextField(),
                  // const CustomPasswordTextField(
                  //   text: "PASSWORD",
                  // ),
                  const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xffA97C37),
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      fontFamily: "Gilroy-Bold",
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const SignInUpButton(
                    text: 'Sign In',
                    width1: 110,
                    width2: 146,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Gilroy-Medium",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xffA97C37),
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            fontFamily: "Gilroy-Bold",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
