import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField(
      {super.key, required this.text, required this.onChanged});

  final String text;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
        labelText: text,
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
          Icons.fingerprint,
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
