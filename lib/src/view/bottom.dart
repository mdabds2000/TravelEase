import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/src/controller/bottom_controller.dart';
import 'package:travel_ease/src/view/screen/history/screens/history.dart';
import 'package:travel_ease/src/view/screen/home/home.dart';
import 'package:travel_ease/src/view/screen/location/view/location.dart';
import 'package:travel_ease/src/view/screen/notification/screens/notifications.dart';
import 'package:travel_ease/src/view/screen/profile/screen/profile.dart';

class CustomBottomBar extends StatelessWidget {
  final BottomController bottomController = Get.put(BottomController());
  CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Obx(() {
        switch (bottomController.selectedIndex.value) {
          case 0:
            return const HomeScreen();
          case 1:
            return const HistoryScreen();
          case 2:
            return const LocationScreen();
          case 3:
            return const NotificationScreen();
          case 4:
            return ProfileScreen();
          default:
            return const HomeScreen();
        }
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          margin: const EdgeInsets.only(bottom: 5, left: 0, right: 0, top: 5),
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0)),
            color: AppColor.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomNavItem(AppAsset.homeTab, 0),
              _buildBottomNavItem(AppAsset.billListTab, 1),
              _buildBottomNavItem(AppAsset.locationTab, 2),
              _buildBottomNavItem(AppAsset.notificationTab, 3),
              _buildBottomNavItem(AppAsset.profileTab, 4),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavItem(
    String icon,
    int index,
  ) {
    var isSelected = bottomController.selectedIndex.value == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.3.h),
          child: IconButton(
              onPressed: () => bottomController.updateTab(index),
              icon: SvgPicture.asset(icon,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xffE6EEEF).withOpacity(.5),
                  height: 3.h)),
          // Container(
          //   height: 1.h,
          //   width: 1.5.w,
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: isSelected ? Colors.white : Colors.transparent),
          // )
        )
      ],
    );
  }
}
