import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/employee_app/features/profile_edit/controller/edit_profile_controller.dart';

class EditProfileEmployeeScreen extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
                  children: [
                    TextField(
                      controller: controller.firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextField(
                      controller: controller.lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: controller.addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                    ),
                    TextField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                    ),
                
                    TextField(
                      controller: controller.bankNameController,
                      decoration: InputDecoration(labelText: 'Bank Name'),
                    ),
                    TextField(
                      controller: controller.bankRIBController,
                      decoration: InputDecoration(labelText: 'Bank RIB'),
                    ),
              
                    TextField(
                      controller: controller.dateBirthController,
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        int userId = 1; // Pass actual user ID here
                        controller.updateUserProfile(userId);
                      },
                      child: Text("Save"),
                    ),
                    if (controller.errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          controller.errorMessage.value,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
            )),
      ),
    );
  }
}
