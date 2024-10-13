import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  // New colors
  static const Color dateColor = Color(0xFFEDEDF0);
  static const Color primaryBlue = Color(0xFF4A90E2);
  static Color backgroundColor = Color(0xFF1C1E24);
  static Color lightGreyColor = Color(0xFFB3B3B3);
  static Color whiteColor = Color(0xFFF8F8F9);
  static Color blackColor = Color(0xFF000000);

  // static const Color backgroundApp = Color(0xFF1C1E24);
  static const Color secondaryGreen = Color(0xFF50C878);
  static const Color appBar = Color(0xFF101219);

  // New Linear Gradient for background
  static const LinearGradient gradientBackground = LinearGradient(
    colors: [
      Color(0xFFBFBFBF), // Start color at 0%
      Color(0xFFFFFFFF), // Color at 40%
      Color(0xFFFFFFFF), // Color at 60%
      Color(0xFFBFBFBF), // End color at 100%
    ],
    stops: [0.0, 0.4, 0.6, 1.0], 
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
