import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/widgets/common/item_home_collection.dart';

class buildCollectionsList extends StatelessWidget {
  final NavigationController controller = Get.find();
  buildCollectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedArtist = controller.selectedArtist.value;
      if (selectedArtist == null) return const SizedBox.shrink();

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: selectedArtist.collection.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ItemHomeCollection(
              artist: selectedArtist,
              collectionIndex: index,
              title: 'Collection ${index + 1}',
              description: selectedArtist.collection[index].description,
              imageUrls: selectedArtist.collection[index].collectionImagesUrls,
            ),
          );
        },
      );
    });
  }
}
