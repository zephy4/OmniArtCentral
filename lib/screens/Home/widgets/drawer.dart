import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.primaryColor,
      width: 270.w,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.h, left: 24.w, bottom: 8.h),
                    width: double.infinity,
                    decoration:
                        const BoxDecoration(color: ColorsManager.primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 54.r,
                          // backgroundImage: ,
                        ),
                        Text(
                          StringManager.username,
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w700,
                            fontSize: 19.sp,
                            color: ColorsManager.white,
                          ),
                        ),
                        Text(
                          StringManager.userEmail,
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: ColorsManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: ColorsManager.white,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 56.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.artCollection,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(
                              AssetManager.artCollectionIcon,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.artists,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon:
                                SvgPicture.asset(AssetManager.artisDrawertIcon),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.gallery,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(AssetManager.galleriesIcon),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.live,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(AssetManager.liveEventsIcon),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.community,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(AssetManager.communityIcon),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.notification,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(
                                AssetManager.notificationDrawerIcon),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                StringManager.wishlist,
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                            ),
                            icon: SvgPicture.asset(AssetManager.wishList),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: ColorsManager.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 60.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: const Color.fromARGB(255, 169, 127, 32),
                              ),
                              child: Center(
                                child: Text(
                                  StringManager.walkInCeo,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 60.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 169, 127, 32),
                                    width: 2.w,
                                  ),
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AssetManager.messageDrawerIcon,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorsManager.white,
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 12.h, left: 14.w, right: 16.w),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 63, 63, 63),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              StringManager.approvedArtist,
                              style: TextStyle(
                                fontFamily: "ProximaNova",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 40.h,
            color: ColorsManager.white,
            child: const Divider(
              thickness: 1,
              color: ColorsManager.dividerColor,
            ),
          ),
          Container(
            color: ColorsManager.white,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
              child: Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetManager.logoutIcon),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          StringManager.logout,
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 63, 63, 63),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // )
        ],
      ),
    );
  }
}
