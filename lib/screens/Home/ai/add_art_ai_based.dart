// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:onmi_art_central/controllers/navigation_controller.dart';
// import 'package:onmi_art_central/screens/Home/HomePage.dart';
// import 'package:onmi_art_central/screens/Home/widgets/home_appbar.dart';
// import 'package:onmi_art_central/screens/add_art/add_art_one_scree.dart';
// import 'package:onmi_art_central/screens/messages/messages_list_screen.dart';
// import 'package:onmi_art_central/screens/profile/profile_screen.dart';
// import 'package:onmi_art_central/widgets/common/custom_bottom_nav.dart';

// class HomeNavbar extends GetView<NavigationController> {
//   const HomeNavbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> screens = [
//       const HomePage(),
//       const Scaffold(body: Center(child: Text('Gallery'))),
//       const AddArtOneScreen(),
//       MessagesListScreen(
//           // last_message: const [
//           //   "Dominion without whose fifth..",
//           //   "Second in green subdue",
//           //   "His Evening hath",
//           //   "Let life him. Second Winged",
//           //   "Which gathered lesser the own..",
//           //   "Lights male second have djhjh khakbjh m xckjshi quhiwsdkx m kiq uhifsdcm uiwhegskdx igwsk dv k",
//           //   "Dominion without whose...."
//           // ],
//           // username: const [
//           //   "Alice Henry",
//           //   "Justin Mounkes",
//           //   "Theresa Webb",
//           //   "Darell Steward",
//           //   "Kristin Watson",
//           //   "Arlene McCoy",
//           //   "Leslie Alexander"
//           // ],
//           ),
//       // const Scaffold(body: Center(child: Text('Messages'))),

//              ProfileScreen(isFromEdit: false,),

//     ];

//     return Scaffold(
//       appBar: HomeAppBar(
//         controller: controller,
//       ),
//       backgroundColor: Colors.white,
//       body: Obx(() => screens[controller.selectedIndex.value]),
//       bottomNavigationBar: Obx(
//         () => CustomBottomNav(
//           currentIndex: controller.selectedIndex.value,
//           onTap: controller.changePage,
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/Home/HomePage.dart';
import 'package:onmi_art_central/screens/Home/widgets/home_appbar.dart';
import 'package:onmi_art_central/screens/add_art/add_art_one_scree.dart';
import 'package:onmi_art_central/screens/messages/messages_list_screen.dart';
import 'package:onmi_art_central/screens/profile/profile_screen.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SecondHomeDashboard extends GetView<NavigationController> {
  SecondHomeDashboard({super.key});
  @override
  NavigationController controller = Get.put(NavigationController());

  final FocusNode _focusNode = FocusNode();
  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Widget> screens = [
      HomePage(),
      const Scaffold(
        body: Center(
          child: Text(
            StringManager.gallery,
          ),
        ),
      ),
      const AddArtOneScreen(),
      MessagesListScreen(),
      ProfileScreen(isFromEdit: false),
    ];

    return SlidingUpPanel(
      controller: controller.spanelController,
      minHeight: 85.h,
      maxHeight: 550.h,
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      panelSnapping: !controller.isPanelOpen.value,
      onPanelSlide: (position) {
        controller.isPanelOpen.value = position == 1.0;
      },
      header: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Container(
          decoration: const BoxDecoration(),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: 145.w,
              ),
              Center(
                child: Container(
                  height: 5.h,
                  width: 80.w,
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(
                width: 115.w,
              ),
              GestureDetector(
                onTap: () {
                  controller.spanelController.close();
                },
                child: const Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ],
          ),
        ),
      ),
      panelBuilder: (ScrollController sc) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          controller: sc, // Use the ScrollController for scrollable content
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32.h),
              Obx(() => _buildStepQuestion(context)),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
        appBar: HomeAppBar(controller: controller),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Obx(
          () => Stack(
            children: [
              screens[controller.selectedIndex.value],
              Positioned(
                left: controller.xPos.value,
                top: controller.yPos.value,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    controller.change(details);
                  },
                  child: AnimatedContainer(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    height: controller.isExpanded.value ? 365.h : 50.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      shape: controller.isExpanded.value
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                    ),
                    duration: const Duration(milliseconds: 400),
                    child: controller.isExpanded.value
                        ? SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsManager.primaryColor,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4.h),
                                  GestureDetector(
                                    onTap: controller.expanding,
                                    child: CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.white,
                                      child: const Icon(
                                        Icons.close_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  _NavbarItem(Icons.home_filled,
                                      Icons.home_outlined, 0),
                                  SizedBox(height: 8.h),
                                  _NavbarItem(Icons.photo_camera_back_rounded,
                                      Icons.photo_camera_back_outlined, 1),
                                  SizedBox(height: 8.h),
                                  _NavbarItem(
                                      Icons.add, Icons.add_circle_rounded, 2),
                                  SizedBox(height: 8.h),
                                  _NavbarItem(Icons.chat_bubble_rounded,
                                      Icons.chat_bubble_outline_rounded, 3),
                                  SizedBox(height: 8.h),
                                  _NavbarItem(Icons.person_2_rounded,
                                      Icons.person_2_outlined, 4),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: controller.expanding,
                            child: CircleAvatar(
                              backgroundColor: ColorsManager.primaryColor,
                              child: Icon(
                                Icons.apps_rounded,
                                size: 20.sp,
                                color: ColorsManager.white,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _NavbarItem(final IconData selectedIcon, final IconData unSelectedIcon,
      final int index) {
    final isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () {
        // onTap(index);
        controller.changePage(index);
      },
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: Colors.white,
        child: Icon(
          isSelected ? selectedIcon : unSelectedIcon,
          color: isSelected ? ColorsManager.primaryColor : ColorsManager.grey,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildStepQuestion(BuildContext context) {
    switch (controller.selectedStep.value) {
      case 0:
        return Column(
          children: [
            _buildPromptTextField(
              hintText: 'Please add all pictures of your Art',
            ),
            SizedBox(height: 15.h),
            _buildUploadImageSection(),
          ],
        );
      case 1:
        return Column(
          children: [
            _buildPromptTextField(
              hintText: 'Please add all pictures of your Art',
            ),
            SizedBox(height: 15.h),
            _buildUploadImageSection(),
            Divider(
              color: ColorsManager.transGrey,
              height: 38.h,
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
            ),
            _buildPromptTextField(
              hintText: 'Choose one to use as main picture:',
            ),
            _buildImageList(),
            Divider(
              color: ColorsManager.transGrey,
              height: 10.h,
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildPromptTextField(
              hintText: 'Please add all pictures of your Art',
            ),
            SizedBox(height: 15.h),
            _buildUploadImageSection(),
            Divider(
              color: ColorsManager.transGrey,
              height: 38.h,
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
            ),
            _buildPromptTextField(
              hintText: 'Choose one to use as main picture:',
            ),
            _buildImageList(),
            Divider(
              color: ColorsManager.transGrey,
              height: 30.h,
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
            ),
            _buildPromptTextField(
              hintText: 'Following picture is Selected:',
            ),
            _buildImageSelectionForMain(),
            Divider(
              color: ColorsManager.transGrey,
              height: 38.h,
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
            ),
            _buildPromptTextField(
              hintText: 'Describe your Artwork',
            ),
            SizedBox(
              height: 8.h,
            ),
            _buildDescriptionList(),
            SizedBox(height: 5.h),
            _buildDescriptionInput(context),
            SizedBox(height: 8.h),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildDescriptionList() {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: List.generate(controller.artDescriptions.length, (index) {
            final description = controller.artDescriptions[index];
            return ListTile(
              title: Container(
                constraints: BoxConstraints(minHeight: 50.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.primaryColor,
                    width: sqrt2,
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 14.sp, color: ColorsManager.grey),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _buildImageSelectionForMain() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
      child: Obx(() {
        if (controller.mainImage.value != null) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.file(
                  File(controller.mainImage.value!),
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          return const Text('No image selected');
        }
      }),
    );
  }

  Widget _buildDescriptionInput(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final RxBool isTyping = false.obs;
    final FocusNode focusNode = FocusNode();
    final RxBool isListening = false.obs;

    void startListening() async {
      isListening.value = true;
      String spokenText = await controller.getSpeechInput();
      if (spokenText.isNotEmpty) {
        textController.text += spokenText;
        isTyping.value = true;
      }
      isListening.value = false;
    }

    void onSendPressed() {
      if (textController.text.isNotEmpty) {
        controller.updateArtDescription(textController.text.trim());
        controller.addToHistory(textController.text.trim());
        textController.clear();
        isTyping.value = false; // Reset typing state
        FocusScope.of(context).unfocus();
      }
    }

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Row(
            children: [
              Expanded(
                child: isListening.value
                    ? Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: ColorsManager.white,
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(
                            color: ColorsManager.blue,
                            width: sqrt2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Lottie.asset(
                              "assets/icons/waveform.json",
                              fit: BoxFit.fitHeight,
                              repeat: true,
                            ),
                          ),
                        ),
                      )
                    : TextField(
                        focusNode: _focusNode,
                        maxLines: null,
                        controller: textController,
                        onChanged: (value) {
                          isTyping.value =
                              value.isNotEmpty; // Update icon based on input
                        },
                        decoration: InputDecoration(
                          hintText: StringManager.speakhere,
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'ProximaNova',
                            color: ColorsManager.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsManager.blue, width: sqrt2),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsManager.blue, width: sqrt2),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: const BorderSide(
                                color: ColorsManager.blue, width: sqrt2),
                          ),
                        ),
                      ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onLongPress: startListening,
                onLongPressEnd: (_) {
                  if (isListening.value) {
                    isListening.value = false;
                  }
                },
                onTap: isTyping.value ? onSendPressed : null,
                child: CircleAvatar(
                  radius: 22.r,
                  backgroundColor: ColorsManager.primaryColor,
                  child: isTyping.value
                      ? SvgPicture.asset(
                          AssetManager.sendIcon,
                          colorFilter: const ColorFilter.mode(
                              ColorsManager.white, BlendMode.srcIn),
                        )
                      : isListening.value
                          ? const Icon(Icons.mic_off, color: Colors.white)
                          : SvgPicture.asset(
                              AssetManager.micIcon,
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget _buildDescriptionInput() {

//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//     child: TextFormField(
//       focusNode: _focusNode,
//       maxLines: null,
//       onChanged: (value) {
//         controller.updateArtDescription(value);
//       },
//       decoration: InputDecoration(
//         hintText: 'Describe your art...',
//         hintStyle: TextStyle(
//           fontSize: 15.sp,
//           fontFamily: 'ProximaNova',
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//         ),
//       ),
//     ),
//   );
// }

  // Upload Image Section (with DottedBorder)
  Widget _buildUploadImageSection() {
    return SizedBox(
      width: 210.w,
      height: 180.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 2,
          color: ColorsManager.primaryColor,
          radius: Radius.circular(8.r),
          borderType: BorderType.RRect,
          child: InkWell(
            onTap: () {
              controller.pickImages(); // Open the image picker
            },
            child: Container(
              height: 180.h,
              width: 354.w,
              decoration: const BoxDecoration(
                color: ColorsManager.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetManager.uploadArtIcon),
                  SizedBox(height: 10.h),
                  Text(
                    StringManager.uploadArt,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorsManager.lightBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Image List Display (via ListView)
  Widget _buildImageList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
      child: Obx(() {
        return SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedImages.length,
            itemBuilder: (context, index) {
              final image = controller.selectedImages[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: _buildArtPreview(image),
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildArtPreview(String imageUrl) {
    return GestureDetector(
      onTap: () {
        controller.setMainImage(imageUrl); // Set this image as the main image
        controller.selectedStep.value = 2; // Go to the next step (description)
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Obx(() {
          // Add Obx here to listen to `controller.mainImage`
          return Container(
            decoration: BoxDecoration(
              border: controller.mainImage.value == imageUrl
                  ? Border.all(
                      color:
                          ColorsManager.primaryColor, // Add border if selected
                      width: 2.w,
                    )
                  : null,
              borderRadius:
                  BorderRadius.circular(8.r), // Radius for the container
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(5.r), // Radius for the image itself
              child: Image.file(
                File(imageUrl),
                width: 80.h,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }

  // Prompt TextField Helper
  Widget _buildPromptTextField({
    required String hintText,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/omni.svg",
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            hintText,
            style: TextStyle(
              color: ColorsManager.lightTextColor,
              fontSize: 14.sp,
              fontFamily: "ProximaNova",
            ),
          )
        ],
      ),
    );
  }
}
