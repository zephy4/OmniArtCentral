import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class OmniAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final String? firstIcon;
  const OmniAppbar({super.key, this.title, this.titleColor, this.firstIcon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                title ?? "Add Art",
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? ColorsManager.darkTextColor,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Row(
                children: [
                  GestureDetector(
                    
                    onTap: () {
                      Get.toNamed(Routes.VIDEO_MEETING);
                    },
                    child: SvgPicture.asset(
                      firstIcon ?? AssetManager.videoIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: const ColorFilter.mode(
                        ColorsManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                 
                ],
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsManager.primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
