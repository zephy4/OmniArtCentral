import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final int? maxlines;
  final TextEditingController? controller;

  MyTextField(
      {required this.labelText,
      required this.hintText,
      required this.onChanged,
      this.maxlines,
      this.controller,
      super.key});

  OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.transGrey, width: 2.w),
    borderRadius: BorderRadius.circular(10.r),
  );

  OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.primaryColor, width: 2.w),
    borderRadius: BorderRadius.circular(10.r),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.primaryColor,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxlines ?? 1,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: ColorsManager.lightTextColor,
        ),
        border: border,
        focusedBorder: focusedBorder,
        counterText: '',
        labelText: labelText,
        hintStyle: const TextStyle(
          color: ColorsManager.primaryColor,
        ),
        hintText: hintText,
      ),
    );
  }
}
