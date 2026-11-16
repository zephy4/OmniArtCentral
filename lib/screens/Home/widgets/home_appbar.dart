import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavigationController controller;

  const HomeAppBar({
    super.key,
    required this.controller,
  });

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
              child: Obx(
                () => Text(
                  controller.currentTitle.value,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Row(
                children: [
                  InkWell(
                    splashColor: ColorsManager.transparent,
                    highlightColor: ColorsManager.transparent,
                    onTap: () {
                      Get.toNamed(Routes.VIDEO_MEETING);
                    },
                    child: SvgPicture.asset(
                      AssetManager.videoIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: const ColorFilter.mode(
                        ColorsManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  // SvgPicture.asset(
                  //   AssetManager.searchIcon,
                  //   height: 24.h,
                  //   width: 24.w,
                  //   colorFilter: const ColorFilter.mode(
                  //     ColorsManager.primaryColor,
                  //     BlendMode.srcIn,
                  //   ),
                  // ),
                ],
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
