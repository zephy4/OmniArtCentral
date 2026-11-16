import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class CustomTextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Rx<FocusNode> focusNode; // Updated to Rx<FocusNode>
  final String hintText;
  final String labelText;
  final RxString errorText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final String? maxLines;

  const CustomTextInputWidget(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.hintText,
      required this.labelText,
      required this.errorText,
      required this.onChanged,
      this.validator,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              return TextFormField(
                controller: controller,
                focusNode: focusNode.value, // Use .value here
                maxLines: maxLines != null ? int.parse(maxLines!) : null,
                decoration: InputDecoration(
                  hintText: focusNode.value.hasFocus ? '' : hintText,
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  floatingLabelStyle: const TextStyle(
                    color:
                        // focusNode.value.hasFocus
                        //     ? ColorsManager.primaryColor
                        //     :
                        ColorsManager.inactiveBorderColor,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  errorStyle: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsManager.errorColor,
                  ),
                ),
                onChanged: onChanged,
                validator: validator,
              );
            },
          ),
          Obx(
            () {
              if (errorText.value.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: 4.h, left: 10.w),
                  child: Text(
                    errorText.value,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorsManager.errorColor,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
