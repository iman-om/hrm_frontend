

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/features/auth/controllers/auth_controller.dart';
import 'package:hrm_front/common/features/auth/controllers/role_selection_controller.dart';
import 'package:hrm_front/common/features/auth/views/widgets/input_widget.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/widgets/RoleSelection.dart';
import 'package:hrm_front/widgets/gradient_button copy.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthenticationController authController =
      Get.put(AuthenticationController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RoleSelectionController roleSelectionController =
      Get.put(RoleSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  AppColors.gradientBackground, 
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  Center(
                    child: Image.asset(
                      'assets/logos/logo.png',
                      height: 100,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Welcome Text
                  Text(
                    'Kickstart Your Adventure: Pick Your Role!',
                    style: TextStyle(
                      color:
                          AppColors.blackColor, 
                      fontSize: 22,
                      fontWeight: FontWeight.bold, 
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => RoleSelectionBox(
                          role: 'Manager',
                          iconPath: 'assets/icons/businessman.png',
                          isSelected:
                              roleSelectionController.selectedRole.value ==
                                  'Manager',
                          onTap: () {
                            roleSelectionController.selectRole('Manager');
                          },
                        ),
                      ),
                      const SizedBox(width: 12),

                      Obx(
                        () => RoleSelectionBox(
                          role: 'Employee',
                          iconPath: 'assets/icons/employees.png',
                          isSelected:
                              roleSelectionController.selectedRole.value ==
                                  'Employee',
                          onTap: () {
                            roleSelectionController.selectRole('Employee');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  InputWidget(
                    hintText: 'E-mail',
                    controller: _emailController,
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

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
                                fontWeight:
                                    FontWeight.bold, 
                                fontFamily: 'AppFontFamily',
                              ),
                              textAlign: TextAlign
                                  .center, 
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
                          ? () {} 
                          : () {
                              String selectedRole =
                                  roleSelectionController.selectedRole.value;

                              authController.login(
                                _emailController.text,
                                _passwordController.text,
                                selectedRole,
                              );
                            },
                    );
                  }),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}