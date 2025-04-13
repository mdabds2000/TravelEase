import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/history/components/timeline.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';
import 'package:truck_ease/src/view/widget/card.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({super.key});

  final events = [
    TimelineEvent(
        status: 'Checking', date: 'Completed: 05 June 2025', isCompleted: true),
    TimelineEvent(
        status: 'Waiting for pick up order',
        date: 'Completed: 07 June 2025',
        isCompleted: true),
    TimelineEvent(
        status: 'Checking',
        date: 'On transit: 09 June 2025',
        isCompleted: true),
    TimelineEvent(
        status: 'Checking', date: 'Pending: 10 June 2025', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(isEnabled: false, title: 'Track order'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.vSpace,
            GeneralCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.vSpace,
                Text('#301220269827', style: h3Style.copyWith(fontSize: 15.sp)),
                1.vSpace,
                Text('On transit: 12 June 2025',
                    style: h3Style.copyWith(
                        fontSize: 15.sp, color: AppColor.greyDark)),
                1.vSpace,
              ],
            )),
            1.vSpace,
            SizedBox(
                height: 30.h,
                width: 100.w,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Frame.png',
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AppButton(
                            width: 26.w,
                            padding: EdgeInsets.symmetric(vertical: .8.h),
                            text: 'Live tracking',
                            onPressed: () => {}),
                      ),
                    ),
                  ],
                )),
            2.vSpace,
            Padding(
              padding: leftPadding,
              child: Text(
                'Tracking history',
                style: h3Style.copyWith(fontSize: 16.sp),
              ),
            ),
            CustomTimelineWidget(events: events),
          ],
        ),
      ),
    );
  }
}
