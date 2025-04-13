import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1.h),
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.lightBlue,
            child: SvgPicture.asset(
              AppAsset.notificationTab,
              color: AppColor.primaryColor.withOpacity(.7),
              height: 2.h,
            ),
          ),
          3.hSpace,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                3.hSpace,
                Text(
                  'Payment order is confirmed',
                  style: h3Style.copyWith(fontSize: 14.5.sp, letterSpacing: .8),
                ),
                1.vSpace,
                Text(
                  'Your truck booking for 05-03 from new york is confirmed.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                2.vSpace,
                Text(
                  '20 Seconds ago',
                  style: h3Style.copyWith(
                      fontSize: 14.5.sp,
                      letterSpacing: .8,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          1.vSpace,
        ],
      ),
    );
  }
}
