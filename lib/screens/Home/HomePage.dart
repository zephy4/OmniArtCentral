import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/screens/Home/widgets/artist_item.dart';
import 'package:onmi_art_central/screens/Home/widgets/build_collections_list.dart';

class HomePage extends GetView<NavigationController> {
  HomePage({super.key});
  @override
  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            height: 200,
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
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: buildCollectionsList(),
        ),
      ],
    );
  }
}
