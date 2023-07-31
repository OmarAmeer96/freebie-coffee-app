import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import 'get_started_screen.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  static String id = 'OnBoarding';

  final List<Introduction> list = [
    Introduction(
      title: 'Explore Coffee Delights',
      subTitle:
          "Embark on a delightful journey through a diverse selection of coffee flavors and find the perfect brew that suits your taste buds.",
      imageUrl: 'assets/images/onboarding3.png',
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Gilroy-Bold',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 20,
        fontFamily: 'Gilroy-Regular',
      ),
    ),
    Introduction(
      title: 'Sip with Confidence',
      subTitle:
          "Experience hassle-free ordering and payment processes as we ensure smooth and secure transactions for every cup of coffee you enjoy.",
      imageUrl: 'assets/images/onboarding2.png',
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Gilroy-Bold',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 20,
        fontFamily: 'Gilroy-Regular',
      ),
    ),
    Introduction(
      title: 'Expertly Crafted Brews',
      subTitle:
          "Let our team of passionate baristas guide you through the art of coffee-making, from beginner to connoisseur, we've got your coffee journey covered!",
      imageUrl: 'assets/images/onboarding1.png',
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Gilroy-Bold',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 20,
        fontFamily: 'Gilroy-Regular',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: const Color(0xFF1a1512),
      foregroundColor: const Color(0xFFA97C37),
      introductionList: list,
      onTapSkipButton: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStarted(),
        ),
      ),
      skipTextStyle: const TextStyle(
        color: Color(0xffA97C37),
        fontSize: 18,
      ),
    );
  }
}
