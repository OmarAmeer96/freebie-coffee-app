import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInUpButton extends StatelessWidget {
  const SignInUpButton(
      {super.key,
      required this.text,
      required this.width1,
      required this.width2});

  final String text;
  final double width1;
  final double width2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xff55433C),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width2,
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Gilroy-Bold',
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          SizedBox(
            width: width1,
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
