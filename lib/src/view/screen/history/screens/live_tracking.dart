import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/history/screens/track_order.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/card.dart';

class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(isEnabled: false, title: 'Live Tracking'),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => TrackOrderScreen()),
            child: SizedBox(
                height: 50.h,
                width: 100.w,
                child: Image.asset(
                  'assets/images/mapImg.png',
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
              child: Container(
            width: 100.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyBorder),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            height: 30.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.vSpace,
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: .7.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.greyBorder),
                  ),
                ),
                2.vSpace,
                Padding(
                  padding: leftPadding,
                  child: Text(
                    'Delivery information',
                    style: h3Style.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 15.sp),
                  ),
                ),
                2.vSpace,
                GeneralCard(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        1.vSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lorry: ',
                                style:
                                    h4Style.copyWith(color: AppColor.greyDark)),
                            Text('Status:',
                                style:
                                    h4Style.copyWith(color: AppColor.greyDark)),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Electric truck', style: h4Style),
                            Text('On the way', style: h4Style),
                          ],
                        ),
                        2.vSpace,
                      ],
                    )
                  ],
                )),
                1.vSpace,
              ],
            ),
          )),
        ],
      ),
    );
  }
}
