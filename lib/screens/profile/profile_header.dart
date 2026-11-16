import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String? coverImageUrl;
  final String? caption;
  final String? profilePicUrl;
  final bool isSelected;
  final VoidCallback? onTap;

  const ProfileHeader({
    super.key,
    required this.userName,
    this.coverImageUrl,
    this.caption,
    this.profilePicUrl,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManager.white,
          border: Border.all(
            color: isSelected ? ColorsManager.primaryColor : Colors.grey[300]!,
            width: 1.5.sp,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(coverImageUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20.h,
                  left: 10.w,
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: const BoxDecoration(
                      color: ColorsManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        AssetManager.placeholder,
                        width: 40.r,
                        height: 40.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 27.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  userName,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.darkTextColor,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(
                caption ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: ColorsManager.mediumTextcolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
