import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utill/constants/color_manager.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Rx<TextEditingController> controller;

  const TextFormFieldWidget({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller.value,
      obscureText: widget.obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: ColorsManager.strokeColr),
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorsManager.strokeColr, width: sqrt2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorsManager.strokeColr, width: sqrt2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:
              BorderSide(color: ColorsManager.primaryColor, width: sqrt2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red, width: sqrt2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red, width: sqrt2),
        ),
        labelText: widget.hint,
        labelStyle: TextStyle(
          color: ColorsManager.strokeColr,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
