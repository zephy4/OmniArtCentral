import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class ButtonListenerWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color backGroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? size;

  const ButtonListenerWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.backGroundColor,
    this.textColor = ColorsManager.white,
    this.borderColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: SizedBox(
        height: 45.h,
        width: size,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(backGroundColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: borderColor != null
                    ? BorderSide(color: borderColor!, width: 1)
                    : BorderSide
                        .none, // Apply border only if borderColor is provided
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor, // Use the passed textColor
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
