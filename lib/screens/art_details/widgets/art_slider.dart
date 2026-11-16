import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtSlider extends StatelessWidget {
  final String url;
  const ArtSlider({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Container(
        height: 40.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              url,
            ),
          ),
        ),
      ),
    );
  }
}
