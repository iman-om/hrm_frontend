import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/widgets/gradient_button.dart'; // Ensure this path is correct

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splash2.jpg', // Update this with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          // Black overlay with 40% opacity
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // HRM Pro Logo
          Positioned(
            top: 50,
            right: 20,
            child: Image.asset(
              'assets/logos/logo.png',
              height: 100,
            ),
          ),

          // Centered welcome text and paragraph
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Center content vertically
              children: [
                // Welcome text
                Text(
                  'Welcome to HRM Pro!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),

                // Subtitle text (paragraph)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Your all-in-one solution for efficient team management and employee success. Optimize your workforce together!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Positioned Next button at the bottom
          Positioned(
            bottom: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: GradientButton(
                text: 'Next',
                onTap: () {
                  Get.toNamed(
                      '/login'); // Ensure the login route is properly defined in GetX
                },
                width: 250,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
