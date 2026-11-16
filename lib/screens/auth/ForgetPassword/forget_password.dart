import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';
import 'package:onmi_art_central/screens/auth/login/login_button_widget.dart';
import 'package:onmi_art_central/screens/auth/login/phone_no_widget.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/utill/constants/text_helpers.dart';
import '../../../utill/constants/color_manager.dart';

class ForgetPasswordPage extends GetView<AuthController> {
  bool isPasswordVisible = false;
  String? confirmPasswordValue;

  GlobalKey<FormState> Key = GlobalKey<FormState>();

  ForgetPasswordPage({super.key});

  final AuthController _loginController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 70.h,
                            width: 186.w,
                            margin: EdgeInsets.only(top: 0.h),
                            child: SvgPicture.asset(AssetManager.omniLogo),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: titleTextStyle(
                            StringManager.forgetPasswordMark,
                            TextAlign.center,
                            ColorsManager.mediumTextcolor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 15.h),
                          child: lightTextStyle(StringManager.weWillSendyou,
                              TextAlign.center, ColorsManager.lightTextColor),
                        ),
                        Form(
                          key: Key,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: PhoneNumberInputWidget(
                                  onDone: (value) {},
                                ),
                              ),
                              SizedBox(
                                width: 380.w,
                                height: 50.h,
                                child: ButtonListenerWidget(
                                  buttonText: StringManager.getCode,
                                  onTap: () {
                                    _loginController.phoneError.value = '';
                                    if (_loginController
                                        .phoneController.value.text.isEmpty) {
                                      _loginController.phoneError.value =
                                          StringManager.enterPhone;
                                    }
                                    // controller.resetPassword();
                                  },
                                  backGroundColor: ColorsManager.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
