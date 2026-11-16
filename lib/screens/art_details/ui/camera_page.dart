import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/screens/art_details/widgets/picture_view.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class CameraPage extends StatelessWidget {
  CameraPage({super.key});

  AddArtController controller = Get.put(AddArtController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.isCameraInitialized) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          child: CameraPreview(controller.cameraController),
                        ),
                      ),
                    ),
                    PictureView(
                      borderColor: ColorsManager.transGrey,
                      imageUrls: controller.ImageUrl,
                      pageController: controller.pageController,
                    ),
                    Positioned(
                      top: 50.h,
                      left: 20.w,
                      child: Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.white,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
