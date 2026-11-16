import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';

class InputSectionWidget extends StatelessWidget {
  final NavigationController controller;
  final TextTheme textTheme;

  const InputSectionWidget({
    super.key,
    required this.controller,
    required this.textTheme,
  });

  // NavigationController controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: controller.isListening.value
              ? Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: ColorsManager.blue,
                      width: sqrt2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Lottie.asset(
                        "assets/icons/waveform.json",
                        fit: BoxFit.fitHeight,
                        repeat: true,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 45.h,
                  child: TextField(
                    onSubmitted: (value) {
                      // Handle text submission if needed
                    },
                    maxLines: null,
                    controller: controller.textController,
                    onChanged: (value) {
                      // Update the isTyping value based on whether the text is empty or not
                      controller.isTyping.value = value.isNotEmpty;
                    },
                    decoration: InputDecoration(
                      hintText: StringManager.speakAnswer,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'ProximaNova',
                        color: ColorsManager.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsManager.blue,
                          width: sqrt2,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsManager.blue,
                          width: sqrt2,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(
                          color: ColorsManager.blue,
                          width: sqrt2,
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: controller.onSendPressed,
          onLongPress: controller.startListening,
          onLongPressEnd: (_) {
            if (controller.isListening.value) {
              controller.isListening.value = false;
            }
          },
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: ColorsManager.primaryColor,
            child: controller.isTyping.value
                ? SvgPicture.asset(
                    AssetManager.sendIcon,
                    colorFilter: const ColorFilter.mode(
                        ColorsManager.white, BlendMode.srcIn),
                  )
                : controller.isListening.value
                    ? const Icon(Icons.mic_off, color: Colors.white)
                    : SvgPicture.asset(
                        AssetManager.micIcon,
                      ),
          ),
        ),
      ],
    );
  }
}
