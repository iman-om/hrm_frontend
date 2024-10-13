import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common_features/auth/controllers/auth_controller.dart';
import 'package:hrm_front/common_features/auth/data/values/colors.dart';
import 'package:hrm_front/common_features/auth/views/widgets/input_widget.dart';
import 'package:hrm_front/widgets/gradient_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Get instance of the authentication controller
  final AuthenticationController authController = Get.put(AuthenticationController());

  // Controllers for email and password text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.gradientBackground, // Apply gradient background
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),

                  // Welcome Text
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.black, // Updated to use black directly
                      fontSize: 36,
                      fontFamily: 'AppFontFamily',
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Email TextField
                  InputWidget(
                    hintText: 'E-mail',
                    controller: _emailController,
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

                  // Password TextField with Toggle Visibility
                  Obx(() {
                    return InputWidget(
                      hintText: 'Password',
                      controller: _passwordController,
                      obscureText: !authController.passwordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.passwordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.lightGreyColor,
                        ),
                        onPressed: authController.togglePasswordVisibility,
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  // Error message
                  Obx(() {
                    return authController.errorMessage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              authController.errorMessage.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'AppFontFamily',
                              ),
                            ),
                          )
                        : Container();
                  }),

                  const SizedBox(height: 40),

                  // Sign In Button
                  Obx(() {
                    return GradientButton(
                      text: authController.isLoading.value
                          ? 'Loading...'
                          : 'Sign in',
                      onTap: authController.isLoading.value
                          ? () {} // Disable action when loading
                          : () {
                              // Attempt to log in
                              authController.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            },
                    );
                  }),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Positioned logo at the top
          Positioned(
            top: 100,
            right: 0,
            left: 0,
            child: Center(
              child: Image.asset(
                'assets/logos/logo.png',
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
