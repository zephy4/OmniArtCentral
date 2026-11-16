import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/auth/widgets/custom_text_input_field.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class bottomSlidingUpPanel extends StatelessWidget {
  final NavigationController controller;
  final PanelController panelController;

  const bottomSlidingUpPanel({
    required this.panelController,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: 60.h, 
      maxHeight: MediaQuery.of(context).size.height * 0.7,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      panel: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Draggable Handle
              Container(
                width: 65.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Manage Collection",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),

              // Example content in panel
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    CustomTextInputWidget(
                      controller: controller.title.value,
                      focusNode: controller.titleFocusNode,
                      hintText: 'Enter your collection name',
                      labelText: 'Collection Name',
                      errorText: controller.titleError,
                      onChanged: (value) {
                        // controller.title.value =
                        //     value.isEmpty ? 'Title Required' : '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextInputWidget(
                      controller: controller.description.value,
                      focusNode: controller.descriptionFocusNode,
                      hintText: '',
                      labelText: 'Description',
                      errorText: controller.descriptionError,
                      onChanged: (value) {
                        // controller.title.value =
                        //     value.isEmpty ? 'Title Required' : '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                      maxLines: 6.toString(),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                          child: Image.network(
                            'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/1ec8c66a-95c2-437b-a8ac-5a8f1ff88618/width=450/workspace_trainsamples_696986060139353168_9ffc1d0b-a659-4c4c-83aa-6448c9d33f99.jpeg ${index + 1}.svg',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
