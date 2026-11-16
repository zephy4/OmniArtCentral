import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';
import 'package:readmore/readmore.dart';

class CollectionDetails extends GetView<NavigationController> {
  const CollectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const OmniAppbar(title: StringManager.collectionsTitle),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildArtistList(
                context,
                Get.find<NavigationController>(),
              ),
              SizedBox(
                height: 20.h,
              ),
              DisplayArt(controller, textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

Widget DisplayArt(controller, TextTheme textTheme) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ReadMoreText(
          StringManager.artDescription * 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: StringManager.readmore,
          trimExpandedText: StringManager.readless,
          trimLines: 2,
          style: textTheme.titleLarge?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.primaryColor),
          moreStyle: textTheme.titleLarge?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: ColorsManager.primaryColor),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 300.h,
              width: 400.w,
            ),
            SizedBox(
              height: 300.h,
              width: 250.w,
              child: PageView.builder(
                itemCount: controller.ImageUrl.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsManager.strokeColr,
                        width: 5.w,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        controller.ImageUrl[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Positioned(
              left: 310.w,
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      highlightColor: ColorsManager.transparent,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetManager.heartIconn,
                        height: 28.h,
                        width: 28.w,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      highlightColor: ColorsManager.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      highlightColor: ColorsManager.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.color_lens_outlined,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      highlightColor: ColorsManager.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.crop_square_rounded,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      highlightColor: ColorsManager.transparent,
                      onPressed: () {
                        Get.toNamed(Routes.ART_DETAILS);
                      },
                      icon: const Icon(
                        Icons.fullscreen_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.artTitle2,
                style: TextStyle(
                  color: const Color.fromARGB(255, 63, 63, 63),
                  fontSize: 17.sp,
                  fontFamily: "Proxima",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                StringManager.artDimensions,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Proxima",
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
          Text(
            StringManager.price,
            style: TextStyle(
              color: const Color.fromARGB(255, 169, 127, 32),
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
              fontFamily: "Proxima",
            ),
          )
        ],
      ),
      const Divider(
        color: Color.fromARGB(129, 158, 158, 158),
      )
    ],
  );
}
