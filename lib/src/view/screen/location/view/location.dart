import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/location_controller.dart';
import 'package:travel_ease/src/view/screen/location/components/filter_bottom_location.dart';
import 'package:travel_ease/src/view/screen/location/search_txtfield.dart';
import 'package:travel_ease/src/view/screen/location/view/search.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  LocationController lc = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            1.vSpace,
            Padding(
              padding: pagePadding,
              child: SearchTextField(
                controller: lc.locationController,
                focusNode: _searchFocusNode,
                ontap: () {
                  Get.to(() => SearchLocationScreen())?.then((value) {
                    _searchFocusNode.unfocus();
                  });
                },
                hintText: 'Search here',
                prefixIcon: SvgPicture.asset(AppAsset.searchIcon),
              ),
            ),
            2.vSpace,
            Expanded(
              child: SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () =>
                      Get.bottomSheet(const FilterLocationBottomWidget()),
                  child: Image.asset(
                    'assets/images/locationImg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
