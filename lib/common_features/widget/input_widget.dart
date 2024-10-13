import 'package:flutter/material.dart';

class InputWidgets extends StatelessWidget {
  final String hintText;
  final String? labelText; // Added for label text
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? errorText; // Added for error text display

  const InputWidgets({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    required this.controller,
    this.suffixIcon,
    this.errorText, // Optional error text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[300]), 

        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.red, width: 2.0), // Change border color on focus
        ),
        // contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
        errorText: errorText, // Display error text if provided
      ),
    );
  }
}
