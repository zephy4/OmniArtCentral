import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/art_details/widgets/details_row.dart';
import 'package:onmi_art_central/screens/art_details/widgets/picture_view.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class ArtDetails extends GetView<AddArtController> {
  // Initialize the controller
  @override
  final AddArtController controller = Get.put(AddArtController());

  ArtDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: const OmniAppbar(
          title: StringManager.artDetails,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Your existing artist list
                buildArtistList(
                  context,
                  Get.find<NavigationController>(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Stack to overlay arrow buttons on PictureView
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // PictureView
                    Center(
                      child: PictureView(
                        borderColor: controller.isBorder.value
                            ? ColorsManager.black
                            : ColorsManager.transGrey,
                        imageUrls: controller.ImageUrl,
                        pageController: controller.pageController,
                      ),
                    ),
                    // Left Arrow Button
                    Positioned(
                      left: -10.w, // Adjust positioning as needed
                      bottom: 30.h,
                      child: IconButton(
                        splashColor: ColorsManager.transparent,
                        highlightColor: ColorsManager.transparent,
                        onPressed: controller.currentPage.value > 0
                            ? controller.previousPage
                            : null,
                        icon: SvgPicture.asset(
                          AssetManager.previousIcon,
                          color: controller.currentPage.value > 0
                              ? Colors.black
                              : Colors.grey,
                          width: 40.w,
                          height: 40.h,
                        ),
                        tooltip: StringManager.previousImg,
                      ),
                    ),
                    // Right Arrow Button
                    Positioned(
                      right: -7.w, // Adjust positioning as needed
                      bottom: 35.h, // Adjust positioning as needed
                      child: IconButton(
                        splashColor: ColorsManager.transparent,
                        highlightColor: ColorsManager.transparent,
                        onPressed: controller.currentPage.value <
                                controller.ImageUrl.length - 1
                            ? controller.nextPage
                            : null,
                        icon: SvgPicture.asset(
                          AssetManager.nextIcon,
                          colorFilter: ColorFilter.mode(
                            controller.currentPage.value <
                                    controller.ImageUrl.length - 1
                                ? Colors.black
                                : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          width: 40.w,
                          height: 40.h,
                        ),
                        tooltip: StringManager.nextImg,
                      ),
                    ),
                    // Existing top-right buttons
                    Positioned(
                      top: -5.h,
                      right: 20.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: IconButton(
                              tooltip: "Add to Favorites",
                              onPressed: () {
                                controller.toggleFav();
                                Fluttertoast.showToast(
                                  msg: controller.isFav.value
                                      ? "Added to Favourites"
                                      : "Removed from Favourites",
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: ColorsManager.primaryColor,
                                );
                              },
                              icon: controller.isFav.value
                                  ? const Icon(Icons.favorite)
                                  : const Icon(
                                      Icons.favorite_outline_sharp,
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.CAMERA_PAGE);
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 25.h,
                            width: 25.h,
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.COLOR_PAGE);
                              },
                              icon: const Icon(
                                Icons.color_lens_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: IconButton(
                              onPressed: () {
                                controller.toggleBorder();
                              },
                              icon: const Icon(
                                Icons.crop_square_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // Divider
                Padding(
                  padding: EdgeInsets.only(right: 18.0.w),
                  child: const Divider(
                    color: Color.fromARGB(85, 158, 158, 158),
                    height: 20,
                    thickness: 2,
                  ),
                ),
                // Thumbnail Slider

                SizedBox(
                  height: 70.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.ImageUrl.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.currentPage.value = index;
                          controller.pageController.jumpToPage(index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: controller.currentPage.value == index
                                  ? ColorsManager
                                      .primaryColor // Primary color for selected item
                                  : Colors
                                      .transparent, // Transparent border for unselected items
                              width: 2, // Border width
                            ),
                            // borderRadius: BorderRadius.circular(8), // Optional: Add border radius
                          ),
                          child: CachedNetworkImage(
                            imageUrl: controller.ImageUrl[index],
                            width: 60.w,
                            height: 60.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Additional Details
                Padding(
                  padding:
                      EdgeInsets.only(top: 15.h, bottom: 10.h, right: 16.w),
                  child: Text(
                    StringManager.artTitle,
                    style: textTheme.titleLarge?.copyWith(
                        fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManager.originalPrice,
                        style: textTheme.titleLarge?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        StringManager.price,
                        style: textTheme.titleLarge?.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.primaryColor),
                      )
                    ],
                  ),
                ),
                // Artist / Gallery Name
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: const DetailsRow(
                    firstText: StringManager.artist,
                    secondText: StringManager.artGallery,
                  ),
                ),
                const DetailsRow(
                  firstText: StringManager.artDimensions,
                  secondText: StringManager.artType,
                ),
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    StringManager.artDescription * 4,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: textTheme.titleLarge?.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.normal),
                  ),
                ),
                // Buy Now Section
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0.h),
                          child: ButtonListenerWidget(
                            buttonText: StringManager.buyNow,
                            backGroundColor: ColorsManager.primaryColor,
                            textColor: ColorsManager.white,
                            onTap: () {
                              Get.toNamed(Routes.BUYER_ADDRESS);
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: ColorsManager.lightTextColor,
                              size: 17.sp,
                            ),
                            Text(
                              StringManager.countryTaxInfo,
                              textAlign: TextAlign.center,
                              style: textTheme.titleLarge?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorsManager.lightTextColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
