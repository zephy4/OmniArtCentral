import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/auth/login/phone_no_widget.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/screens/auth/widgets/text_field.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/build_artist_tile.dart';

class ProfileScreen extends GetView<NavigationController> {
  bool isFromEdit;
  ProfileScreen({super.key, required this.isFromEdit});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: SingleChildScrollView(
          child: Column(
            // padding: const EdgeInsets.all(8.0),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: buildArtistList(
                  context,
                  Get.find<NavigationController>(),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: TextFormFieldWidget(
                        hint: 'Art Name',
                        controller:
                            Rx<TextEditingController>(TextEditingController()),
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter art name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.firstName,
                        controller:
                            Rx<TextEditingController>(TextEditingController()),
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.lastNameHint,
                        controller:
                            Rx<TextEditingController>(TextEditingController()),
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Full Name Row
                    SizedBox(height: 20.h),

                    PhoneNumberInputWidget(
                      onDone: (value) {},
                    ),
                    // SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.address1,
                        controller:
                            Rx<TextEditingController>(TextEditingController()),
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.address2,
                        controller:
                            Rx<TextEditingController>(TextEditingController()),
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringManager.enableNotifications,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              activeTrackColor: ColorsManager.primaryColor,
                              value: controller.isSwitchOn.value,
                              onChanged: (value) {
                                controller.isSwitchOn.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    ButtonListenerWidget(
                      buttonText: StringManager.changePassword,
                      onTap: () {
                        // controller.phoneError.value = '';
                        // if (controller.phoneController.value.text.isEmpty) {
                        //   controller.phoneError.value =
                        //       'Please enter your phone number';
                        // }

                        // if (formKey.currentState?.validate() ?? false) {
                        //   controller.login();
                        //   Get.offAll(() => SelectionScreen());
                        // }
                      },
                      backGroundColor: ColorsManager.white,
                      textColor: ColorsManager.borderColor,
                      borderColor: ColorsManager.borderColor,
                    ),
                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        // First button
                        Expanded(
                          child: ButtonListenerWidget(
                            buttonText: StringManager.cancel,
                            onTap: () {
                              // controller.phoneError.value = '';
                              // if (controller.phoneController.value.text.isEmpty) {
                              //   controller.phoneError.value =
                              //       'Please enter your phone number';
                              // }

                              // if (formKey.currentState?.validate() ?? false) {
                              //   controller.login();
                              //   Get.offAll(() => SelectionScreen());
                              // }
                            },
                            backGroundColor: ColorsManager.borderColor,
                            textColor: ColorsManager.white,
                            borderColor: ColorsManager.borderColor,
                          ),
                        ),
                        SizedBox(
                            width: 10.w), // Spacing between the two buttons
                        // Second button
                        Expanded(
                          child: ButtonListenerWidget(
                            buttonText: StringManager.save,
                            onTap: () {
                              Get.back();
                              // controller.phoneError.value = '';
                              // if (controller.phoneController.value.text.isEmpty) {
                              //   controller.phoneError.value =
                              //       'Please enter your phone number';
                              // }

                              // if (formKey.currentState?.validate() ?? false) {
                              //   controller.login();
                              //   Get.offAll(() => SelectionScreen());
                              // }
                            },
                            backGroundColor: ColorsManager.primaryColor,
                            textColor: ColorsManager.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
