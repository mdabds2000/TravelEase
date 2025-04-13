import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var searchController = TextEditingController();

  var locationController = TextEditingController();

  var recentSearches = ['Large', 'Pickup truck', 'Small', 'New jersey'].obs;
  var searchResults = <String>[].obs;
  var isSearching = false.obs;

  var searchNowLocations = [
    'San fransico',
    'San Diego',
    'Los Angeles',
    'New York',
    'New Jersey',
    'New Mexico',
    'New Hampshire',
    'New Orleans',
    'New Delhi',
    'New Zealand ',
    'Abu Dhabi',
    'India',
    'Indonesia',
    'Italy',
    'Ireland',
    'Iceland',
    'Iran',
    'Pakistan'
  ];

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(onSearchChanged);
  }

  void onSearchChanged() {
    if (searchController.text.isEmpty) {
      isSearching.value = false;
    } else {
      isSearching.value = true;
      searchResults.value = searchNowLocations
          .where((element) => element
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  @override
  void onClose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.onClose();
  }

  void clearRecentSearch() {
    recentSearches.clear();
  }

  void selectedLocation(String location) {
    locationController.text = location;
    Get.back();
  }

  // filter location bottom data

  var showTime = false.obs;

  void showTimeState() {
    showTime.value = true;
  }

  void resetTimeState() {
    showTime.value = false;
  }
}
