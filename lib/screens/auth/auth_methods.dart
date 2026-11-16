import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';

import '../../utill/constants/color_manager.dart';

class AuthMethods extends StatelessWidget {
  const AuthMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(color: ColorsManager.red)),
          child: CircleAvatar(
            backgroundColor: ColorsManager.white,
            child: Image.asset(AssetManager.googleImage),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(color: ColorsManager.red)),
          child: CircleAvatar(
            backgroundColor: ColorsManager.white,
            child: Image.asset(AssetManager.facebookImage),
          ),
        )
      ],
    );
  }
}
