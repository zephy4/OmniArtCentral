import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/auth/login/password_widget.dart';
import 'package:onmi_art_central/screens/auth/login/phone_no_widget.dart';
import 'package:onmi_art_central/screens/auth/otp/otp_screen.dart';
import 'package:onmi_art_central/screens/auth/widgets/custom_text_input_field.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';
import '../login/login_page.dart';

class SignUpPage extends GetView<AuthController> {
  SignUpPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      resizeToAvoidBottomInset:
          true, // Ensures the screen adjusts for the keyboard
      body: Obx(() {
        return LoadingOverlay(
          progressIndicator: const CupertinoActivityIndicator(),
          isLoading: controller.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 70.h,
                          width: 186.w,
                          margin: EdgeInsets.only(top: 90.h),
                          child: SvgPicture.asset(AssetManager.omniLogo),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 45.h, bottom: 0.h),
                          child: Center(
                            child: Text(
                              StringManager.signUp,
                              style: TextStyle(
                                color: ColorsManager.darkTextColor,
                                fontFamily: 'ProximaNova',
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 15.h),
                          child: lightTextStyle(StringManager.sigUpMessage,
                              TextAlign.center, ColorsManager.lightTextColor),
                        ),
                        SizedBox(height: 16.h),
                        CustomTextInputWidget(
                          controller: controller.firstNameController.value,
                          focusNode: controller.firstNameFocusNode,
                          hintText: StringManager.enterFirstName,
                          labelText: StringManager.firstName,
                          errorText: controller.firstNameError,
                          onChanged: (value) {
                            controller.firstNameError.value =
                                value.isEmpty ? 'First name is required' : '';
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextInputWidget(
                          controller: controller.lastNameController.value,
                          focusNode: controller.lastNameFocusNode,
                          hintText: StringManager.enterLastName,
                          labelText: StringManager.lastNameHint,
                          errorText: controller.lastNameError,
                          onChanged: (value) {
                            controller.lastNameError.value =
                                value.isEmpty ? 'Last name is required' : '';
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0.h),
                        PhoneNumberInputWidget(
                          onDone: (value) {},
                        ),
                        SizedBox(height: 5.0.h),
                        PasswordInputWidget(controller: controller),
                        SizedBox(height: 18.h),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonListenerWidget(
                            buttonText: StringManager.next,
                            onTap: () {
                              controller.phoneError.value = '';
                              if (controller
                                  .phoneController.value.text.isEmpty) {
                                controller.phoneError.value =
                                    StringManager.enterPhone;
                              }
                              if (formKey.currentState?.validate() ?? false) {
                                Get.to(OtpScreen());
                                // controller.login();
                              }
                            },
                            backGroundColor: ColorsManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h, top: 20.h),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN_IN);
                    },
                    child: Center(
                      child: Wrap(
                        children: [
                          textStyle2(StringManager.iAlreadyHaveAnAccount,
                              TextAlign.center, ColorsManager.lightTextColor),
                          SizedBox(width: 3.w),
                          underlineTextStyle(StringManager.login,
                              TextAlign.center, ColorsManager.redTextColr),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
