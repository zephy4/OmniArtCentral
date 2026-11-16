import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class ChatHistoryWidget extends StatelessWidget {
  final NavigationController controller;
  final TextTheme textTheme;

  const ChatHistoryWidget({
    super.key,
    required this.controller,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...controller.chatHistory.map((chat) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/omni.svg",
                        height: 40.h,
                        width: 40.w,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        chat['question'] ?? '',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: ColorsManager.chatBotEditTextColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                        color: ColorsManager.blue,
                        width: 1.5.w,
                      ),
                    ),
                    child: Text(
                      chat['answer'] ?? '',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                        color: ColorsManager.chatBotEditTextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}



class SlidingPanelHeader extends StatelessWidget {
  const SlidingPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: ColorsManager.white),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(color: ColorsManager.white),
          child: Container(
            height: 5.h,
            width: 80.w,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}