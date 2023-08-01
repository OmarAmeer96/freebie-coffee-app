import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/widgets/custom_email_textfiled.dart';
import 'package:freebie_coffee_app/widgets/custom_password_textfield.dart';
import 'package:freebie_coffee_app/widgets/signin_up_button.dart';
import 'dart:ui';
import '../widgets/custom_app_logo.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static String id = 'SignUpScreen';
  String? email;
  String? password;
  String? rePassword;

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
                    height: 55,
                  ),
                  const CustomAppLogo(),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    "Sign Up",
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
                    "Let’s create you an account.",
                    style: TextStyle(
                      color: Color(0xffbbb9b8),
                      fontSize: 18,
                      letterSpacing: 0.5,
                      fontFamily: 'Gilroy-Medium',
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  CustomEmailTextField(
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  CustomPasswordTextField(
                    text: "PASSWORD",
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  CustomPasswordTextField(
                    text: "RE-PASSWORD",
                    onChanged: (data) {
                      rePassword = data;
                    },
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        // ignore: unused_local_variable
                        UserCredential user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        // ignore: use_build_context_synchronously
                        showSnackBar(
                            context, "Your account successfully created.");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              "The account already exists for that email.");
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                    },
                    child: const SignInUpButton(
                      text: 'Sign Up',
                      width1: 104,
                      width2: 140,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Gilroy-Medium",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
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

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(text),
    ),
  );
}
