import 'package:flutter/material.dart';

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({super.key, required this.onChanged});

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
        labelText: 'E-MAIL',
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
          Icons.email_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
