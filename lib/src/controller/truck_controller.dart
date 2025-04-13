import 'package:get/get.dart';

import '../model/popularTrucks_model.dart';

class TruckController extends GetxController {
  var checkFavlist = <PopularTruckModel>[].obs;

  void toggleFavorite(PopularTruckModel truck) {
    if (checkFavlist.contains(truck)) {
      checkFavlist.removeWhere((element) => element.id == truck.id);
    } else {
      checkFavlist.add(truck);
    }
    update();
  }

  bool isFavorite(PopularTruckModel truck) {
    return checkFavlist.any((element) => element.id == truck.id);
  }

  // bottom sheet

  var selectedSize = ''.obs;
  List<String> size = ['Small', 'Medium', 'Large'].obs;

  void changeSize(int index) {
    selectedSize.value = size[index];
    update();
  }

  void clearFilter() {
    selectedSize.value = '';
    update();
  }
}
