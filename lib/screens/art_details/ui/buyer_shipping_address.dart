import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/art_details/widgets/buyer_text_field.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class BuyerScreen extends StatelessWidget {
  BuyerScreen({super.key});

  AddArtController controller = Get.put(AddArtController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const OmniAppbar(
        title: StringManager.buyArt,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0.h, bottom: 20.0.h, left: 16.w),
              child: buildArtistList(
                context,
                Get.find<NavigationController>(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 350.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(120, 158, 158, 158),
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1731076274484-e3882b02d523?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw4fHx8ZW58MHx8fHx8",
                            height: 270.h,
                            width: 400.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            StringManager.artTitle,
                            style: textTheme.bodySmall?.copyWith(
                                color: ColorsManager.darkTextColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                StringManager.originalPrice,
                                style: textTheme.bodySmall?.copyWith(
                                  color: ColorsManager.darkTextColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                StringManager.price,
                                style: textTheme.bodySmall?.copyWith(
                                  color: ColorsManager.primaryColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      StringManager.shippingAddress,
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorsManager.darkTextColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: ColorsManager.primaryColor,
                            splashRadius: 1,
                            value: controller.isChecked.value,
                            onChanged: (value) {
                              controller.isChecked.value = value!;
                            }),
                        Text(
                          StringManager.sameAddress,
                          style: textTheme.bodySmall?.copyWith(
                              color: ColorsManager.darkTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: MyTextField(
                      controller: controller.zipcodeController,
                      maxlines: 1,
                      labelText: StringManager.zipCode,
                      hintText: StringManager.zipCode,
                      onChanged: (value) {
                        value.isEmpty ? 'Zip Code is required' : '';
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 165.w,
                        child: MyTextField(
                          controller: controller.city,
                          maxlines: 1,
                          labelText: StringManager.city,
                          hintText: StringManager.city,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 165.w,
                        child: MyTextField(
                          controller: controller.state,
                          maxlines: 1,
                          labelText: StringManager.state,
                          hintText: StringManager.state,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: MyTextField(
                      controller: controller.shippingAddress,
                      labelText: StringManager.shippingAddress,
                      hintText: StringManager.shippingAddress,
                      onChanged: (value) {},
                    ),
                  ),
                  MyTextField(
                    controller: controller.discount,
                    labelText: StringManager.discount,
                    hintText: StringManager.discount,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: ButtonListenerWidget(
                      size: 250.w,
                      buttonText: StringManager.next,
                      backGroundColor: ColorsManager.primaryColor,
                      textColor: ColorsManager.white,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
