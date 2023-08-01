import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/signup_screen.dart';
import 'package:freebie_coffee_app/widgets/custom_email_textfiled.dart';
import 'package:freebie_coffee_app/widgets/custom_password_textfield.dart';
import 'package:freebie_coffee_app/widgets/signin_up_button.dart';
import 'dart:ui';
import '../widgets/custom_app_logo.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  static String id = 'SignInScreen';
  final _form = GlobalKey<FormState>();
  String? email;
  String? password;
  String? rePassword;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

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
              child: Form(
                key: _form,
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
                      height: 75,
                    ),
                    CustomEmailTextField(
                      controller: _emailController,
                      onChanged: (data) {
                        email = data;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address.';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomPasswordTextField(
                      controller: _passwordController,
                      text: "PASSWORD",
                      onChanged: (data) {
                        password = data;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password.';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                      height: 75,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_form.currentState!.validate()) {
                          try {
                            // ignore: unused_local_variable
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            // ignore: use_build_context_synchronously
                            showSnackBar(
                                context, "Your account successfully created.");
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, HomeScreen.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                  context, "No user found for that email.");
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(context,
                                  "Wrong password provided for that user.");
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString());
                          }
                        }
                      },
                      child: const SignInUpButton(
                        text: 'Sign In',
                        width1: 110,
                        width2: 146,
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
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
