import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String text;
  final Function(String) onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator; // New validator attribute

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;

  void _togglePasswordIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField( // Changed to TextFormField to support validation
      controller: widget.controller,
      obscureText: obscureText,
      onChanged: widget.onChanged,
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
        labelText: widget.text,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Gilroy-Medium',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff55433c), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff55433c), width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff55433c), width: 1.0),
        ),
        prefixIcon: const Icon(
          Icons.fingerprint,
          color: Colors.white,
        ),
        suffixIcon: InkWell(
          onTap: () {
            _togglePasswordIcon();
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
      ),
      validator: widget.validator, // Validator attribute added
    );
  }
}
