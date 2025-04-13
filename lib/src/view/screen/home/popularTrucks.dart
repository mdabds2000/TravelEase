import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/src/view/screen/home/bottom_sheet.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/home/components/popularTruck_widget.dart';

class PopularTrucksScreen extends StatelessWidget {
  const PopularTrucksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        isEnabled: true,
        filterPress: () {
          Get.bottomSheet(const BottomSheetWidget());
        },
        title: 'Popular trucks',
      ),
      body: ListView.builder(
          itemCount: popularTruck.length,
          itemBuilder: (_, index) {
            var truckData = popularTruck[index];
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TruckCardWidget(truckModel: truckData),
            );
          }),
    );
  }
}
