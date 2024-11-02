import 'package:flutter/material.dart';

class InputWidgets extends StatelessWidget {
  final String hintText;
  final String? labelText; 
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const InputWidgets({
    super.key,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[300]), 

        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.red, width: 2.0), 
        ),
      ),
    );
  }
}
