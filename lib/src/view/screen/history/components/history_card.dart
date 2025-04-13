import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/card.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralCard(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Large truck | ZAE-98756547,',
                  style: h3Style.copyWith(fontSize: 15.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDDF3EF)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: Text(
                        'Delivery',
                        style: h3Style.copyWith(
                            color: AppColor.secondaryColor, fontSize: 15.sp),
                      ),
                    ),
                  ),
                )
              ],
            ),
            1.vSpace,
            Text(
              '\$780.00',
              style: h3Style.copyWith(
                  fontSize: 15.sp, color: AppColor.secondaryColor),
            ),
            2.vSpace,
            Text(
              'Driver name | Bryan loads',
              style: h3Style.copyWith(fontSize: 15.sp),
            ),
            1.vSpace,
            Text(
              'Date : Sat, 03 mar 24',
              style: h3Style.copyWith(fontSize: 15.sp),
            ),
            1.vSpace,
          ],
        ))
      ],
    );
  }
}
