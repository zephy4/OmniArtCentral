import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/app_bottom_sheet.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class AddArtStepThreeUploadArtScreen extends GetView<NavigationController> {
  const AddArtStepThreeUploadArtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const OmniAppbar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Fixed Artist List
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: const _ArtistList(),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 22.0.w),
                        child: Text(
                          StringManager.addtoSelectedCollection,
                          style: textTheme.titleMedium?.copyWith(
                              fontSize: 16.sp,
                              color: ColorsManager.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: DottedBorder(
                          dashPattern: const [8, 4],
                          strokeWidth: 2,
                          color: ColorsManager.primaryColor,
                          radius: const Radius.circular(8),
                          borderType: BorderType.RRect,
                          child: InkWell(
                            onTap: () {
                              controller.pickImages();
                            },
                            child: SizedBox(
                              height: 180.h,
                              width: 354.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AssetManager.uploadArtIcon),
                                  SizedBox(height: 10.h),
                                  Text(
                                    StringManager.uploadArt,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontSize: 16.sp,
                                      color: ColorsManager.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: GetX<NavigationController>(
                          init: controller,
                          builder: (controller) {
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.pickedImages.length,
                              itemBuilder: (context, index) {
                                String imagePath =
                                    controller.pickedImages[index].path;

                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            118, 158, 158, 158),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(imagePath),
                                          ),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5.w,
                                      top: 5.h,
                                      child: InkWell(
                                        onTap: () => Get.defaultDialog(
                                          title: StringManager.edit,
                                          content: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  // controller.editImage(index);
                                                },
                                                child: const Text(
                                                    StringManager.edit),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // controller.deleteImage(index);
                                                },
                                                child: const Text(
                                                    StringManager.delete),
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          AssetManager.editUploadedArtIcon,
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Next Button
          Positioned(
            right: 20.w,
            bottom: 70.h,
            child: InkWell(
              onTap: () => Get.toNamed(Routes.ADD_ART_THREE),
              child: const _NextButton(),
            ),
          ),

          // Previous Button
          Positioned(
            bottom: 70.h,
            left: 20.w,
            child: InkWell(
              onTap: () => Get.back(),
              child: const _previousButton(),
            ),
          ),

          // Bottom Sliding Panel
          bottomSlidingUpPanel(
            panelController: controller.panelController,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class _ArtistList extends StatelessWidget {
  const _ArtistList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return buildArtistList(
      context,
      Get.find<NavigationController>(),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}

class _previousButton extends StatelessWidget {
  const _previousButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: ColorsManager.unselectedBorderColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          Icons.arrow_back,
          color: ColorsManager.inactiveBorderColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
