import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 250, // Default width
    this.height = 40, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              colors: [
                Color(0xFFFF0000),
                Color(0xFFCC0000),
              ],
              center: Alignment.center,
              radius: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 4), // Shadow position
                blurRadius: 8, // Shadow blur
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
