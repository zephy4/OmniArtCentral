import 'dart:math';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';

class PhoneNumberInputWidget extends StatelessWidget {
  void Function(String value) onDone;
  PhoneNumberInputWidget({required this.onDone, super.key});

  NavigationController controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.blue,
          width: sqrt2,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (country) {
              controller.selectedCountryCode.value = country.dialCode!;
            },
            initialSelection: 'US',
            favorite: const ['+1', 'US'],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            margin: const EdgeInsets.all(3),
            padding: EdgeInsets.zero,
            textStyle: TextStyle(
              fontFamily: 'ProximaNova',
              color: ColorsManager.mediumTextcolor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: TextField(
              onSubmitted: onDone,
              focusNode: controller.phoneFocusNode.value,
              controller: controller.phoneController.value,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: StringManager.phoneNumberHint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
