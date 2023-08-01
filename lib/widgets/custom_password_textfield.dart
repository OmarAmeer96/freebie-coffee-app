import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Gilroy-Medium',
      ),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          fontFamily: 'Gilroy-Medium',
          color: Colors.white,
        ),
        constraints: const BoxConstraints(
          maxHeight: 80,
          minHeight: 80,
          maxWidth: double.infinity,
          minWidth: double.infinity,
        ),
        labelText: 'PASSWORD',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Gilroy-Medium',
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff55433c), width: 2.5),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff55433c), width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: const Icon(
          Icons.password_outlined,
          color: Colors.white,
        ),
        suffixIcon: const Icon(
          Icons.visibility_off,
          color: Colors.white,
        ),
      ),
    );
  }
}
