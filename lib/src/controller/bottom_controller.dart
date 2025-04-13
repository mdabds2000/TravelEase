import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectedIndex = 0.obs;

  void updateTab(int index) {
    selectedIndex.value = index;
  }

  void resetTab() {
    selectedIndex.value = 0;
  }
}
