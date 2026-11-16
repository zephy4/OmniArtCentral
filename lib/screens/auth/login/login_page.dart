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
import 'package:onmi_art_central/screens/auth/ForgetPassword/forget_password.dart';
import 'package:onmi_art_central/screens/selections/selection_page_screen.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';

import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';
import '../signup/sign_up.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  @override
  AuthController controller = Get.put(AuthController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        resizeToAvoidBottomInset: true,
        body: Obx(
          () => LoadingOverlay(
            isLoading: controller.isLoading.value,
            progressIndicator: const CupertinoActivityIndicator(),
            child: Stack(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          children: [
                            Container(
                              height: 70.h,
                              width: 186.w,
                              margin: EdgeInsets.only(top: 90.h),
                              child: SvgPicture.asset(AssetManager.omniLogo),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                              child: Center(
                                child: SizedBox(
                                  child: Text(
                                    StringManager.login,
                                    style: TextStyle(
                                      color: ColorsManager.darkTextColor,
                                      fontFamily: 'ProximaNova',
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 262.w,
                                height: 40.h,
                                child: Text(
                                  StringManager.pleaseEnterLogin,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsManager.regularTextColor,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0.h),
                            PhoneNumberInputWidget(
                              onDone: (value) {},
                            ),
                            SizedBox(height: 16.0.h),
                            PasswordInputWidget(controller: controller),
                            SizedBox(height: 18.h),
                            ButtonListenerWidget(
                              buttonText: StringManager.login,
                              onTap: () {
                                controller.phoneError.value = '';
                                if (controller
                                    .phoneController.value.text.isEmpty) {
                                  controller.phoneError.value =
                                      StringManager.enterPhone;
                                }

                                if (formKey.currentState?.validate() ?? false) {
                                  controller.login();
                                  Get.offAll(() => SelectionScreen());
                                }
                              },
                              backGroundColor: ColorsManager.primaryColor,
                            ),
                            SizedBox(height: 10.h),
                            InkWell(
                              onTap: () {
                                controller.phoneError.value = '';
                                Get.to(() =>
                                    ForgetPasswordPage()); // Navigate to the ForgetPasswordPage
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: textStyle2(
                                    StringManager.forgetPassword,
                                    TextAlign.right,
                                    ColorsManager.mediumTextcolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.phoneError.value = '';
                          controller.clearFields();
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        child: Center(
                          child: Wrap(
                            children: [
                              textStyle2(
                                  StringManager.createAnAccount,
                                  TextAlign.center,
                                  ColorsManager.lightTextColor),
                              SizedBox(width: 3.w),
                              underlineTextStyle(StringManager.signUp,
                                  TextAlign.center, ColorsManager.redTextColr)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
