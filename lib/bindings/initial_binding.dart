import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/add_art_controller.dart';
import 'package:onmi_art_central/services/artist_service.dart';
import 'package:onmi_art_central/controllers/navigation_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Core services
    Get.put(BaseApiService(), permanent: true);
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => AddArtController());
  }
}
