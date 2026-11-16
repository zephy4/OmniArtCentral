import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureView extends StatelessWidget {
  final List<String> imageUrls;
  final PageController pageController;
  final Color borderColor;
  const PictureView({
    super.key,
    required this.imageUrls,
    required this.pageController,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 4.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: 320.h,
          width: 250.w,
          child: PageView.builder(
            controller: pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
        ),
      ),
    );
  }
}
