import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

PreferredSizeWidget? appTopbar({required Screen screen}) {
  if (Screen.counter == screen) {
    return AppBar(
      title: Text('TEN - Onboarding', style: TextStyle(fontFamily: 'WorkSans')),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff25a2a), Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
  if (Screen.otpValidation == screen) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Iconsax.arrow_left_3_outline,
                  color: AppColors.text,
                ), // back arrow
                SizedBox(width: 8),
                Text(
                  'Change Number',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent, // to see gradient
      elevation: 0,
    );
  }
  return null;
}
