import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/home_screen.dart';
import 'package:freebie_coffee_app/widgets/custom_app_logo.dart';
import 'package:freebie_coffee_app/widgets/custom_email_textfiled.dart';
import 'package:freebie_coffee_app/widgets/custom_password_textfield.dart';
import 'package:freebie_coffee_app/widgets/signin_up_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static String id = 'SignUpScreen';
  String? email;
  String? password;
  String? rePassword;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _form =
      GlobalKey<FormState>(); // Updated to use FormState for validation

  @override
  Widget build(BuildContext context) {
    const Color filterColor = Color(0x80110e0c);

    return Scaffold(
      backgroundColor: const Color(0xff55433c),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
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
                    key: _form, // Use the GlobalKey for validation
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
                        CustomPasswordTextField(
                          controller: _rePasswordController,
                          text: "RE-PASSWORD",
                          onChanged: (data) {
                            rePassword = data;
                          },
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 110,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_form.currentState!.validate()) {
                              // Form is valid, proceed with sign-up
                              try {
                                // ignore: unused_local_variable
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: email!,
                                  password: password!,
                                );
                                // ignore: use_build_context_synchronously
                                showSnackBar(context,
                                    "Your account successfully created.");
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(context, HomeScreen.id);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnackBar(context,
                                      "The password provided is too weak.");
                                } else if (e.code == 'email-already-in-use') {
                                  showSnackBar(context,
                                      "The account already exists for that email.");
                                }
                              } catch (e) {
                                showSnackBar(context, e.toString());
                              }
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to validate email format
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
}
