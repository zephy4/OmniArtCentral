import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/Home/HomePage.dart';
import 'package:onmi_art_central/screens/Home/widgets/home_appbar.dart';
import 'package:onmi_art_central/screens/add_art/add_art_one_scree.dart';
import 'package:onmi_art_central/screens/auth/login/phone_no_widget.dart';
import 'package:onmi_art_central/screens/messages/messages_list_screen.dart';
import 'package:onmi_art_central/screens/profile/profile_screen.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/auth_input_section.dart';
import 'package:onmi_art_central/widgets/common/boolean_button.dart';
import 'package:onmi_art_central/widgets/common/sliding_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeNavbar extends GetView<NavigationController> {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<Widget> screens = [
      HomePage(),
      const Scaffold(
        body: Center(
          child: Text(StringManager.gallery),
        ),
      ),
      const AddArtOneScreen(),
      MessagesListScreen(),
      ProfileScreen(isFromEdit: false),
    ];

    return SlidingUpPanel(
      header: const SlidingPanelHeader(),
      minHeight: 75.h,
      maxHeight: 550.h,
      color: ColorsManager.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      panelBuilder: (ScrollController scrollController) => Material(
        color: Colors.white,
        elevation: 4.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: Scaffold(
          body: Obx(() {
            return SingleChildScrollView(
              reverse: true,
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  ChatHistoryWidget(
                      controller: controller, textTheme: textTheme),
                  if (controller.hasMoreQuestions)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/omni.svg",
                                height: 40.h,
                                width: 40.w,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                controller.currentQuestion,
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                  color: ColorsManager.chatBotEditTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          if (controller.currentQuestionIndex == 0 ||
                              controller.currentQuestionIndex == 8)
                            Column(
                              children: [
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150.w,
                                      child: YesNoButton(
                                        label: "Yes",
                                        onTap: () {
                                          controller.addAnswer("Yes");
                                          controller.optionNo.value = false;
                                          controller.noButtonBorder.value =
                                              true;
                                        },
                                        isYesButton: true,
                                      ),
                                    ),
                                    SizedBox(width: 2.h),
                                    SizedBox(
                                      width: 150.w,
                                      child: YesNoButton(
                                        label: "No",
                                        onTap: () {
                                          controller.optionNo.value = true;
                                          controller.noButtonBorder.value =
                                              false;
                                        },
                                        isYesButton: false,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                controller.optionNo.value
                                    ? GestureDetector(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                            msg: "Coming Soon!",
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor:
                                                ColorsManager.primaryColor,
                                          );
                                        },
                                        child: Container(
                                          height: 50.h,
                                          width: 303.w,
                                          decoration: BoxDecoration(
                                            color: ColorsManager.primaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight:
                                                  Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Submit Your FeedBack",
                                              style: TextStyle(
                                                color: ColorsManager.white,
                                                fontSize: 16.sp,
                                                fontFamily: "ProximaNova",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(height: 2.h),
                              ],
                            )
                          else if (controller.currentQuestionIndex == 3)
                            PhoneNumberInputWidget(
                              onDone: (value) {
                                controller.addAnswer(
                                    "${controller.selectedCountryCode}${controller.phoneController.value.text}");
                              },
                            )
                          else if (controller.currentQuestionIndex == 5)
                            Column(
                              children: [
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150.w,
                                      child: YesNoButton(
                                        label: "Artist",
                                        onTap: () {
                                          controller.addAnswer("Artist");
                                        },
                                        isYesButton: true,
                                      ),
                                    ),
                                    SizedBox(width: 2.h),
                                    SizedBox(
                                      width: 150.w,
                                      child: YesNoButton(
                                        label: "Buyer",
                                        onTap: () {
                                          controller.addAnswer("Buyer");
                                          false;
                                        },
                                        isYesButton: false,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 2.h),
                              ],
                            )
                          else
                            InputSectionWidget(
                              controller: controller,
                              textTheme: textTheme,
                            ),
                          if (controller.errorMessage.value.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                controller.errorMessage.value,
                                style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (controller.isLoading.value)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Column(
                        children: [
                          Text(
                            StringManager.quesThankU,
                            style: textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: const LoadingIndicator(
                              indicatorType: Indicator.ballSpinFadeLoader,
                              colors: [
                                ColorsManager.primaryColor,
                                ColorsManager.buttonColr,
                              ],
                              strokeWidth: 2,
                              backgroundColor: Colors.transparent,
                              pathBackgroundColor: ColorsManager.primaryColor,
                            ),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      ),
      body: Scaffold(
        appBar: HomeAppBar(controller: controller),
        backgroundColor: Colors.white,
        body: Obx(() {
          return Stack(
            children: [
              screens[controller.selectedIndex.value],
            ],
          );
        }),
      ),
    );
  }
}
