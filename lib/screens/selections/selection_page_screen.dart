import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/selection_controller.dart';

import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';

class SelectionScreen extends StatelessWidget {
  final SelectionController controller = Get.put(SelectionController());

  final List<Map<String, dynamic>> items = [
    {"icon": AssetManager.buyerIcon, "label": "I am a Art Buyer"},
    {"icon": AssetManager.artistIcon, "label": "I am an Artist"},
    {"icon": AssetManager.galleryIcon, "label": "I am a Gallery"},
    {"icon": AssetManager.serviceProvider, "label": "I am a Service Provider"},
  ];

  SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              SizedBox(
                height: 240.h,
              ),
              Center(
                child: SvgPicture.asset(
                  AssetManager.omniLogo,
                  height: 80.h,
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.second_home_dashboard),
                child: Container(
                  height: 60.h,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.alreadyLogin,
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorsManager.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Option 2: Sign Up
              GestureDetector(
                onTap: () => Get.toNamed(Routes.HOME),
                child: Container(
                  height: 60.h,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.createAccount,
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorsManager.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isWeb(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide >= 600;
}
