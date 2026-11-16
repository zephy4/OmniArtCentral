import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onmi_art_central/models/artist_model.dart';
import 'package:onmi_art_central/models/collection_model.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class ArtistItem extends StatelessWidget {
  final Artist artist;
  final bool isSelected;
  final VoidCallback? onTap;

  const ArtistItem({
    super.key,
    required this.artist,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.w,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsManager.white,
          border: Border.all(
            color: isSelected ? ColorsManager.primaryColor : Colors.grey[300]!,
            width: 1.5.w,
          ),
          // boxShadow: isSelected
          //     ? [
          //         BoxShadow(
          //           color: ColorsManager.primaryColor.withOpacity(0.3),
          //           blurRadius: 8,
          //           offset: const Offset(0, 4),
          //         )
          //       ]
          //     : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.r),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(artist.imageUrl.first),
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
            SizedBox(height: 22.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  artist.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.darkTextColor,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(
                artist.caption,
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
