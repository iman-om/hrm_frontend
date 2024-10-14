// import 'package:flutter/material.dart';

// class InputWidget extends StatelessWidget {
//   final String hintText;
//   final bool obscureText;
//   final TextEditingController controller;
//   final Widget? suffixIcon;

//   const InputWidget({
//     Key? key,
//     required this.hintText,
//     required this.obscureText,
//     required this.controller,
//     this.suffixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         suffixIcon: suffixIcon, 
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final String? labelText; // Added for label text
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? errorText; // Added for error text display

  const InputWidget({
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
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]), 

        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.black, width: 2.0), 
        ),
        errorText: errorText, 
      ),
    );
  }
}
