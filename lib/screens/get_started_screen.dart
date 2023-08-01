import 'package:flutter/material.dart';
import 'package:freebie_coffee_app/screens/signin_screen.dart';
import 'package:freebie_coffee_app/widgets/custom_app_logo.dart';
import 'package:freebie_coffee_app/widgets/custom_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  static String id = 'GetStarted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff55433c),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/coffee-beans-dark-background-top-view-coffee-concept-banner_1220-6300 1.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(
                  height: 405,
                ),
                const CustomAppLogo(),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "Find your favorite",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    letterSpacing: 0.5,
                    fontFamily: 'Gilroy-Medium',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Coffee Taste!",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy-Heavy',
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "We’re coffee shop, beer and wine bar, & event space for performing arts",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffc0bfc0),
                    fontSize: 20,
                    fontFamily: 'Gilroy-Regular',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SignInScreen.id);
                  },
                  child: const CustomButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
