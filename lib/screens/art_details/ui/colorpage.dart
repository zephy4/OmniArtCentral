import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/screens/art_details/widgets/picture_view.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class ColorPage extends StatelessWidget {
  ColorPage({super.key});

  AddArtController controller = Get.put(AddArtController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.scafColor.value,
        body: Column(
          children: [
            SizedBox(height: 150.h),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2), // Shadow color
                      spreadRadius: 5, // How much the shadow spreads
                      blurRadius: 5, // How soft the shadow looks
                      offset: Offset(4, 4), // Shadow position (X, Y)
                    ),
                  ],
                ),
                child: PictureView(
                  borderColor: ColorsManager.grey,
                  imageUrls: controller.ImageUrl,
                  pageController: controller.pageController,
                ),
              ),
            ),
            SizedBox(height: 100.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                  topRight: Radius.circular(28.r),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      "Background Color",
                      style: TextStyle(
                        color: ColorsManager.titleTextColr,
                        fontFamily: "ProximaNova",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SlidePicker(
                    sliderSize: Size(MediaQuery.of(context).size.width, 50.h),
                    showParams: false,
                    enableAlpha: false,
                    pickerColor: controller
                        .scafColor.value, // Set picker to current color
                    showIndicator: false,
                    colorModel: ColorModel.hsl,
                    onColorChanged: (value) {
                      controller.changeScaf(value);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
