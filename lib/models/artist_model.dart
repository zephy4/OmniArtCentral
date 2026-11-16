import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:onmi_art_central/models/collection_model.dart';

class Artist {
  final String id;
  final String name;
  final List<String> imageUrl;
  final String caption;
  final RxBool isSelected;
  final List<CollectionModel> collection;

  Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.caption,
    bool? isSelected,
    List<CollectionModel>? collection,
  })  : isSelected = (isSelected ?? false).obs,
        collection = collection ?? [];
}