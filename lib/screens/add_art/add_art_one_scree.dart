import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/auth/widgets/custom_text_input_field.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';

class AddArtOneScreen extends GetView<NavigationController> {
  const AddArtOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
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
                      const _SkipStep(),
                      SizedBox(height: 20.h),
                      CustomTextInputWidget(
                        controller: controller.title.value,
                        focusNode: controller.titleFocusNode,
                        hintText: StringManager.collectionHint,
                        labelText: StringManager.collectionlabel,
                        errorText: controller.titleError,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextInputWidget(
                        controller: controller.description.value,
                        focusNode: controller.descriptionFocusNode,
                        hintText: '',
                        labelText: StringManager.collectionDescription,
                        errorText: controller.descriptionError,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description is required';
                          }
                          return null;
                        },
                        maxLines: 8.toString(),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating "Next" Button
          Positioned(
            right: 20.w,
            bottom: 20.h,
            child: InkWell(
              onTap: () => Get.toNamed(Routes.ADD_ART_TWO),
              child: const _NextButton(),
            ),
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
          StringManager.addNewCollection,
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
