import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/controller/bottom_controller.dart';
import 'package:truck_ease/src/view/bottom.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/screen/notification/components/notificationcard.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBarWidget(isEnabled: false, title: 'Notifications'),
        body: empetyNotificationBuild(context)
        //  Container(
        //   padding: pagePadding,
        //   decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        //   width: 100.w,
        //   child: Column(
        //     children: [
        //       2.vSpace,
        //       const NotificationCard(),
        //       2.vSpace,
        //     ],
        //   ),
        // ),
        );
  }
}

Widget empetyNotificationBuild(context) {
  final controller = Get.put(BottomController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(AppAsset.bigBell),
        ),
        4.vSpace,
        Text(
          'No Notification yet',
          style: h3Style,
        ),
        3.vSpace,
        Text(
          'Your notification list is empty please wait for some time or go to home',
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
