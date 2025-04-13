import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/location_controller.dart';
import 'package:travel_ease/src/view/screen/location/components/recent_search_widget.dart';
import 'package:travel_ease/src/view/screen/location/components/search_location_widget.dart';
import 'package:travel_ease/src/view/screen/location/search_txtfield.dart';
import 'package:travel_ease/src/view/screen/location/view/search.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchFocusNode.requestFocus();
  }

  LocationController lc = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              1.vSpace,
              SearchTextField(
                controller: lc.searchController,
                hintText: 'Search here',
                prefixIcon: GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(AppAsset.arrowBack)),
                focusNode: _searchFocusNode,
                onChanged: (value) {
                  lc.onSearchChanged();
                },
              ),
              2.vSpace,
              Expanded(
                child: Obx(() {
                  if (lc.isSearching.value) {
                    if (lc.searchResults.isEmpty) {
                      return noResultBuild();
                    } else {
                      return SearchLocationWidget(lc: lc);
                    }
                  } else {
                    return RecentSearchWidget(lc: lc);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget noResultBuild() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 30.h,
            child: SvgPicture.asset(AppAsset.noResult, height: 100.sp)),
        2.vSpace,
        Text('No result found', style: h2Style),
        2.vSpace,
        Text(
            'No results found for this search type a valid location to place your order ',
            textAlign: TextAlign.center,
            style: h4Style.copyWith(
              fontSize: 16.sp,
              color: AppColor.black.withOpacity(
                .6,
              ),
            )),
      ],
    ),
  );
}
