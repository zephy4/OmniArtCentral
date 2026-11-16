import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/store/local_store.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import '../../utill/constants/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  late AnimationController _circleController;

  @override
  void initState() {
    super.initState();

    // Logo Animation
    _logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeInOut,
    );

    // Circle Animation
    _circleController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    // Start animations
    _logoController.forward();

    // Navigate to the next screen
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Timer(
      const Duration(seconds: 5),
      () async {
        final isUserLoggedIn = await LocalStore.checkLoginStatus();
        if (isUserLoggedIn) {
          // Get.offAll(() => SelectionScreen());
          // Get.toNamed(Routes.SELECTIONS_SCREEN);
          Get.offAllNamed(Routes.SELECTIONS_SCREEN);
        } else {
          // Get.offAll(() => SelectionScreen());
          // Get.toNamed(Routes.SELECTIONS_SCREEN);
          Get.offAllNamed(Routes.SELECTIONS_SCREEN);
        }
      },
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsManager.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: SvgPicture.asset(
                AssetManager.splash,
                fit: BoxFit.cover,
              ),
            ),
            // Rotating Circles
            Center(
              child: AnimatedBuilder(
                animation: _circleController,
                builder: (context, child) {
                  final angle = _circleController.value * 2 * pi;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(100 * cos(angle), 100 * sin(angle)),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorsManager.buttonColr,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-100 * cos(angle), -100 * sin(angle)),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: ColorsManager.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Logo Animation
            Center(
              child: ScaleTransition(
                scale: _logoAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AssetManager.omniLogo,
                      height: 80.h,
                    ),
                    const SizedBox(height: 20),
                    FadeTransition(
                      opacity: _logoAnimation,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
