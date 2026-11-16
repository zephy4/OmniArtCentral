import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/auth/otp/pin_view.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';

class OtpScreen extends GetView<AuthController> {
  OtpScreen({super.key});

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
                                    StringManager.verifAccount,
                                    style: TextStyle(
                                      color: ColorsManager.darkTextColor,
                                      fontFamily: 'ProximaNova',
                                      fontSize: 26.sp,
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
                                  StringManager.pleaseEnterFourDigit,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsManager.regularTextColor,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            const FractionallySizedBox(
                              widthFactor: 1,
                              // You can also checkout the [PinputBuilderExample]
                              child: PinputWidget(),
                            ),
                            Center(
                              child: SizedBox(
                                width: 262.w,
                                // height: 40.h,
                                child: Text(
                                  StringManager.didnotRecieveCode,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsManager.regularTextColor,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: SizedBox(
                                width: 262.w,
                                // height: 40.h,
                                child: Text(
                                  StringManager.resendCode,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsManager.primaryColor,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration
                                        .underline, // Adds underline to the text
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50.h),
                            ButtonListenerWidget(
                              buttonText: StringManager.verify,
                              onTap: () {
                                controller.phoneError.value = '';

                                // Validate phone number manually
                                if (controller
                                    .phoneController.value.text.isEmpty) {
                                  controller.phoneError.value =
                                      StringManager.enterPhone;
                                }

                                if (formKey.currentState?.validate() ?? false) {
                                  Get.toNamed(Routes.SELECTIONS_SCREEN);
                                  controller.login();
                                }
                              },
                              backGroundColor: ColorsManager.primaryColor,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                      Center(
                        child: Wrap(
                          children: [
                            textStyle2(StringManager.privayPolicyAgrement,
                                TextAlign.center, ColorsManager.lightTextColor),
                            SizedBox(width: 3.w),
                            underlineTextStyle(StringManager.privacyPolicy,
                                TextAlign.center, ColorsManager.redTextColr)
                          ],
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
