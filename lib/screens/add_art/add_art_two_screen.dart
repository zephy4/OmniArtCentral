import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/app_bottom_sheet.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class AddArtTwoScreen extends GetView<NavigationController> {
  const AddArtTwoScreen({super.key});

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
                      const _AddNewCollection(),
                      SizedBox(height: 20.h),

                      // Dropdown Container
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                StringManager.selectCollection,
                                style: textTheme.labelSmall?.copyWith(
                                  color: ColorsManager.lightTextColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 24.sp,
                                color: ColorsManager.inactiveBorderColor,
                              ),
                              onPressed: () {
                                controller.isCollectionExpanded.value =
                                    !controller.isCollectionExpanded.value;
                              },
                            ),
                          ],
                        ),
                      ),

                      // Collection List (Expandable)
                      Obx(
                        () => Visibility(
                          visible: controller.isCollectionExpanded.value,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.w, horizontal: 20.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsManager.grey),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Collection ${index + 1}',
                                            style:
                                                textTheme.labelSmall?.copyWith(
                                              color:
                                                  ColorsManager.lightTextColor,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add,
                                              color: ColorsManager
                                                  .inactiveBorderColor,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index < 2)
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 35.w, left: 20.w),
                                        child: const Divider(
                                          color: ColorsManager.strokeColr,
                                        ),
                                      )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
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

          // Sliding Panel
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

class _AddNewCollection extends StatelessWidget {
  const _AddNewCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          StringManager.selectCollection,
          style: textTheme.titleSmall?.copyWith(
            color: ColorsManager.darkTextColor,
            fontFamily: 'ProximaNova',
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _SkipStep extends StatelessWidget {
  const _SkipStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          StringManager.SkipStep1IfAddingArtToExistingCollection,
          style: textTheme.titleSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: ColorsManager.lightTextColor,
          ),
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsManager.inactiveBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringManager.title,
                      maxLines: 1,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorsManager.lightTextColor,
                      ),
                    ),
                  ),
                  TextField(
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorsManager.darkTextColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: StringManager.addTitle,
                      hintStyle: textTheme.titleSmall?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorsManager.lightTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsManager.inactiveBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringManager.description,
                      maxLines: 8,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorsManager.lightTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130.h,
                    child: TextField(
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorsManager.darkTextColor,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringManager.addDescription,
                        hintStyle: textTheme.titleSmall?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: ColorsManager.lightTextColor,
                        ),
                      ),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
