import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/config/routes/app_pages.dart';
import 'package:onmi_art_central/models/artist_model.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:readmore/readmore.dart';
// Import other necessary packages and your ColorsManager, Artist class, etc.

class ItemHomeCollection extends StatefulWidget {
  final Artist artist;
  final int collectionIndex;
  final String title;
  final String description;
  final List<String> imageUrls;

  const ItemHomeCollection({
    required this.artist,
    required this.collectionIndex,
    required this.title,
    required this.description,
    required this.imageUrls,
    super.key,
  });

  @override
  State<ItemHomeCollection> createState() => _ItemHomeCollectionState();
}

class _ItemHomeCollectionState extends State<ItemHomeCollection> {
  bool isExpanded = false; // Start as collapsed to show 5 images + "+" overlay
  bool isExpandedWithArrow = false;

  @override
  Widget build(BuildContext context) {
    final postImages = widget.imageUrls;
    final hasImages = postImages.isNotEmpty;

    const int maxVisibleImages = 5;
    final bool showOverlayButton = postImages.length > maxVisibleImages;

    final int displayCount = isExpanded
        ? postImages.length
        : (showOverlayButton
            ? maxVisibleImages + 1
            : postImages.length); // Show 5 images + overlay if collapsed

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () =>
              setState(() => isExpandedWithArrow = !isExpandedWithArrow),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, top: 0.h, bottom: 0.h),
              child: Icon(
                isExpandedWithArrow
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 34.sp,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: ColorsManager.mediumTextcolor,
                    ),
              ),
              SizedBox(height: 8.h),
              ReadMoreText(
                widget.description,
                trimLines: 2,
                colorClickableText: ColorsManager.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: ' Show less',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorsManager.collectionDesColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                moreStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorsManager.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                lessStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorsManager.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
        if (hasImages) ...[
          if (!isExpandedWithArrow) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.w,
                  childAspectRatio: 1, // Square tiles
                ),
                itemBuilder: (context, index) {
                  // Determine if the current item should have an overlay
                  if (!isExpanded &&
                      index == maxVisibleImages &&
                      showOverlayButton) {
                    // Collapsed state: Show "+" overlay on the 6th image
                    return _buildImageTile(
                      postImages[index],
                      overlayIcon: Icons.add,
                      onOverlayTap: () => setState(() => isExpanded = true),
                      onImageTap: () {
                        // Navigate to Art Detail page for the 6th image
                        _navigateToArtDetail(postImages[index]);
                      },
                    );
                  } else if (isExpanded &&
                      index == postImages.length - 1 &&
                      showOverlayButton) {
                    // Expanded state: Show "–" overlay on the last image
                    return _buildImageTile(
                      postImages[index],
                      overlayIcon: Icons.remove,
                      onOverlayTap: () => setState(() => isExpanded = false),
                      onImageTap: () {
                        // Navigate to Art Detail page for the last image
                        _navigateToArtDetail(postImages[index]);
                      },
                    );
                  } else {
                    // Regular image without any overlay
                    return _buildImageTile(
                      postImages[index],
                      onImageTap: () {
                        // Navigate to Art Detail page for regular images
                        _navigateToArtDetail(postImages[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ]
        ],
      ],
    );
  }

  /// Builds an individual image tile with optional overlay icons
  Widget _buildImageTile(
    String imageUrl, {
    IconData? overlayIcon,
    VoidCallback? onOverlayTap,
    VoidCallback? onImageTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image with its own tap handler
          GestureDetector(
            onTap: onImageTap,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          // Overlay Icon with its own tap handler
          if (overlayIcon != null)
            Center(
              child: GestureDetector(
                onTap: onOverlayTap,
                child: Container(
                  width: 35.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor.withOpacity(0.7),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      overlayIcon,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Navigates to the Art Detail page with the given image URL
  void _navigateToArtDetail(String imageUrl) {
    Get.toNamed(Routes.ART_DETAILS);
  }
}
