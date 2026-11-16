import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class SelectionCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300.h, // Increased height
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.0.r),
          border: Border.all(
            color: isSelected
                ? ColorsManager.primaryColor
                : ColorsManager.unselectedBorderColor,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFB18934).withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 55.h,
                    width: 64.w,
                    colorFilter: ColorFilter.mode(
                      isSelected ? const Color(0xFFB18934) : Colors.black54,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          isSelected ? const Color(0xFFB18934) : Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'ProximaNova',
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Icon(
                  Icons.check_circle,
                  color: const Color(0xFFB18934),
                  size: 28.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
