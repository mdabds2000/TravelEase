import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/src/view/screen/home/bottom_sheet.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/home/components/truckInfo_grid.dart';

class SelectTruckScreen extends StatelessWidget {
  const SelectTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        title: 'Select truck',
        isEnabled: true,
        filterPress: () => Get.bottomSheet(const BottomSheetWidget()),
      ),
      body: const TruckInfoGrid(),
    );
  }
}
