import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/controllers/messages_controller.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';
import 'package:onmi_art_central/repositories/artist_repository.dart';
import 'package:onmi_art_central/repositories/auth_repository.dart';
import 'package:onmi_art_central/services/artist_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtistRepository());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<AddArtController>(() => AddArtController());

  }
}

class MessageBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<MessagesController>(() => MessagesController());

  }
}