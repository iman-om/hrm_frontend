import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionBox extends StatelessWidget {
  final String role;
  // final String description;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleSelectionBox({
    Key? key,
    required this.role,
    // required this.description,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color:  Color.fromARGB(107, 224, 224, 224),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color:
                isSelected ? Colors.black : Colors.grey, 
            width: 1.0, // Border width
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 2.0)
                ] // Shadow for selected
              : null,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(
                      0xFFFFC107), // You can replace with AppColors.yellowColor
                  radius: 25,
                ),
                Container(
                  child: Center(
                    child: Image(
                      width: 50,
                      height: 50,
                      image: ExactAssetImage(iconPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    color:
                    //  r
                      Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   description,
                //   style: const TextStyle(
                //     fontFamily: 'WorkSans',
                //     color:
                //         Color(0xFFFFC107), // Replace with AppColors.yellowColor
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
