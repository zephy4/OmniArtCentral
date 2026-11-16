import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/messages_controller.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/messages/chat_screen.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';

class MessagesListScreen extends GetView<MessagesController> {
  @override
  MessagesController controller = Get.put(MessagesController());

  MessagesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: buildArtistList(
              context,
              Get.find<NavigationController>(),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(top: 0.h, left: 16.w, right: 16.w),
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 2.w,
                  color: ColorsManager.searchBorderColor,
                ),
              ),
              child: TextField(
                onChanged: (value) => controller.searchText.value = value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Conversation",
                  hintStyle: textTheme.bodySmall?.copyWith(
                    color: ColorsManager.lightTextColor,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 16.w,
                  ),
                ),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Divider(
                    height: 1.h,
                    color: ColorsManager.messageTileDividerColor,
                  ),
                ),
                itemCount: controller.filteredUsernames.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: GestureDetector(
                    onTap: () => Get.to(
                      () => ChatScreen(
                        username: controller.filteredUsernames[index],
                      ),
                    ),
                    child: Container(
                      height: 65.h,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: SvgPicture.asset(
                                  AssetManager.placeholder,
                                  width: 35.r,
                                  height: 35.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.filteredUsernames[index],
                                    style: textTheme.titleLarge?.copyWith(
                                        color: ColorsManager.mediumTextcolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    controller.filteredLastMessages[index],
                                    maxLines: 1,
                                    style: textTheme.titleSmall?.copyWith(
                                        color:
                                            ColorsManager.messageDesTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                AssetManager.videoBorderedIcon,
                                height: 32.h,
                                width: 32.w,
                              ),
                            ),
                            SizedBox(width: 8.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
