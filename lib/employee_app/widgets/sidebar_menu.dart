import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:hrm_front/employee_app/features/profile/controller/profile_controller.dart';

class SidebarMenu extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  SidebarMenu({super.key}) {
    int userId = 2;
    profileController.fetchUserProfile(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(() {
            if (profileController.isLoading.value) {
              return const DrawerHeader(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (profileController.errorMessage.isNotEmpty) {
              return DrawerHeader(
                child: Center(
                  child: Text(
                    profileController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            final userProfile = profileController.userProfile.value;

            return DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: userProfile.photo?.isNotEmpty == true
                        ? NetworkImage(userProfile.photo!)
                        : const AssetImage('assets/images/woman.jpg')
                            as ImageProvider, 
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${userProfile.firstName} ${userProfile.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            );
          }),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.back();
              Get.toNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.back();
              Get.toNamed('/employee_profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.back();
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Get.back();
              Get.offNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
