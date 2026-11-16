import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class SnackbarUtil {
  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorsManager.vibrantPeach,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorsManager.primaryColor,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
