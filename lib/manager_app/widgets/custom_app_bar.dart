import 'package:flutter/material.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/common/data/values/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String leftIconPng;
  final String rightIconPng;
  final VoidCallback? onPressedLeftBtn;
  final VoidCallback? onPressedRightBtn;

  const CustomAppBar({
    Key? key,
    required this.text,
    required this.leftIconPng,
    required this.rightIconPng,
    this.onPressedLeftBtn,
    this.onPressedRightBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBar,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onPressedLeftBtn,
                child: Image.asset(
                  leftIconPng,
                  width: 35,
                  height: 35,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: AppConstants.fontFamilyWorkSansSemiBold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: onPressedRightBtn,
                child: Image.asset(
                  rightIconPng,
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}
