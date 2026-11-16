import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class YesNoButton extends StatelessWidget {
  String label;
  bool isYesButton;

  void Function() onTap;
  YesNoButton(
      {required this.isYesButton,
      required this.onTap,
      required this.label,
      super.key});

  NavigationController controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 190.w,
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: controller.noButtonBorder.value
              ? BorderRadius.circular(10.r)
              : isYesButton
                  ? BorderRadius.only(topLeft: Radius.circular(10.r))
                  : BorderRadius.only(topRight: Radius.circular(10.r)),
        ),
        child: Center(
          child: Text(
            isYesButton ? label : label,
            style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: 16.sp,
              color: ColorsManager.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
