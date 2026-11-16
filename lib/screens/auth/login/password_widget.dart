import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';

import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';

class PasswordInputWidget extends StatelessWidget {
  final AuthController controller;

  const PasswordInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Obx(
        () {
          return TextFormField(
            controller: controller.passwordController.value,
            obscureText: controller.isPasswordHidden.value,
            focusNode: controller.passwordFocusNode.value,
            decoration: InputDecoration(
              hintText: controller.passwordFocusNode.value.hasFocus
                  ? '••••••••'
                  : StringManager.password,
              labelText: StringManager.password,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  controller.isPasswordHidden.value =
                      !controller.isPasswordHidden.value;
                },
              ),
              floatingLabelStyle: TextStyle(
                color: controller.passwordFocusNode.value.hasFocus
                    ? ColorsManager.primaryColor
                    : ColorsManager.inactiveBorderColor,
                fontWeight: FontWeight.bold, // Optional: Make it bold
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: ColorsManager.inactiveBorderColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: ColorsManager.errorColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: ColorsManager.primaryColor,
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: ColorsManager.errorColor,
                  width: 2.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              errorStyle: TextStyle(
                fontSize: 12.sp,
                color: ColorsManager.errorColor,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringManager.enterPassword; // Display error message
              }
              return null; // Valid input
            },
          );
        },
      ),
    );
  }
}
