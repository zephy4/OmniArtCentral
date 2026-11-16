import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/Home/widgets/build_collections_list.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class VideoMeeting extends GetView<NavigationController> {
  VideoMeeting({super.key});

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OmniAppbar(
        title: "Artist Name",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.h,
              bottom: 10.h,
            ),
            child: Container(
              height: 45.h,
              width: 350.w,
              margin: EdgeInsets.only(left: 8.w, right: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorsManager.transGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: SizedBox(
                      width: 26.w,
                      height: 26.h,
                      child: SvgPicture.asset(AssetManager.meetingIcon1),
                    ),
                  ),
                  SizedBox(
                    width: 26.w,
                    height: 26.h,
                    child: SvgPicture.asset(AssetManager.meetingIcon2),
                  ),
                  SizedBox(
                    width: 26.w,
                    height: 26.h,
                    child: SvgPicture.asset(AssetManager.meetingIcon3),
                  ),
                  SizedBox(
                    width: 26.w,
                    height: 26.h,
                    child: SvgPicture.asset(AssetManager.meetingIcon4),
                  ),
                  SizedBox(
                    width: 26.w,
                    height: 26.h,
                    child: SvgPicture.asset(AssetManager.meetingIcon5),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  InkWell(
                    highlightColor: ColorsManager.transparent,
                    splashColor: ColorsManager.transparent,
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetManager.users),
                        Text(
                          "$count",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    highlightColor: ColorsManager.transparent,
                    onPressed: () {
                      Get.back();
                    },
                    // padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      size: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: buildArtistList(
              context,
              Get.find<NavigationController>(),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: buildCollectionsList(),
          ),
        ],
      ),
    );
  }
}
