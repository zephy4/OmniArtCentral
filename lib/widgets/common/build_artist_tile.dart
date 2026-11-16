import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/Home/widgets/artist_item.dart';

Widget buildArtistList(BuildContext context, NavigationController controller) {
  bool tablet = isTablet(context);
  double responsiveHeight = tablet ? 160.h : 150.h;
  return Container(
    height: responsiveHeight,
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 0.h),
    child: Obx(() {
      final selectedArtistId = controller.selectedArtist.value?.id;
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        itemCount: controller.artists.length,
        itemBuilder: (context, index) {
          final artist = controller.artists[index];
          return SizedBox(
            child: ArtistItem(
              artist: artist,
              isSelected: artist.id == selectedArtistId,
              onTap: () => controller.selectArtist(artist),
            ),
          );
        },
      );
    }),
  );
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide >= 600;
}
