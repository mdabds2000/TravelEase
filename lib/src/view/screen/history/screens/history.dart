import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/bottom_controller.dart';
import 'package:travel_ease/src/view/bottom.dart';
import 'package:travel_ease/src/view/screen/history/screens/history_truckDetail.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

import '../components/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(isEnabled: false, title: 'History'),
      body:
          //   noHistoryBuild(),
          ListView.separated(
        itemCount: 4,
        itemBuilder: (_, index) {
          return GestureDetector(
              onTap: () => Get.to(const HistoryTruckDetailScreen()),
              child: const HistoryCardWidget());
        },
        separatorBuilder: (context, index) => 2.vSpace,
      ),
    );
  }
}

noHistoryBuild() {
  final controller = Get.put(BottomController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(AppAsset.clock),
        ),
        4.vSpace,
        Text(
          'No Notification yet',
          style: h3Style,
        ),
        3.vSpace,
        Text(
          'Your history is empty please wait for some time or go to home',
          textAlign: TextAlign.center,
          style: h4Style.copyWith(
              color: AppColor.greyDark.withOpacity(.9), fontSize: 16.sp),
        ),
        3.vSpace,
        AppButton(
            text: 'Go home',
            onPressed: () {
              controller.resetTab();
              Get.offAll(CustomBottomBar());
            }),
      ],
    ),
  );
}
