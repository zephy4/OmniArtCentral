import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/auth_controller.dart';
import 'package:onmi_art_central/repositories/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
