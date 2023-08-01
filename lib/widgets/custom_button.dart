import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xff55433C),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 97,
          ),
          const Text(
            'Get Started',
            style: TextStyle(
              fontFamily: 'Gilroy-Bold',
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          const SizedBox(
            width: 63,
          ),
          SvgPicture.asset(
            'assets/svg/arrow_forward.svg',
            width: 22,
            height: 21,
          ),
        ],
      ),
    );
  }
}
