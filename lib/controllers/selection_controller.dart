import 'package:get/get.dart';

class SelectionController extends GetxController {
  var selectedIndex = (-1).obs;

  void selectCard(int index) {
    selectedIndex.value = index;
  }
}
