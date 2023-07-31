import 'package:flutter/material.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/image 2.png",
            width: 70,
            height: 70,
          ),
          const Text(
            "COFFEE TASTE!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gilroy-Bold',
              fontSize: 15.5,
              wordSpacing: 2,
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
