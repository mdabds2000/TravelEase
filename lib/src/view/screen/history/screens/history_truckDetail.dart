import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/history/screens/chat.dart';
import 'package:truck_ease/src/view/screen/history/screens/live_tracking.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';
import 'package:truck_ease/src/view/widget/card.dart';
import 'package:truck_ease/src/view/widget/delete_dialogue.dart';

class HistoryTruckDetailScreen extends StatelessWidget {
  const HistoryTruckDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(isEnabled: false, title: 'Truck Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            shippingAddressBuild(),
            SizedBox(height: 1.5.h),
            driverInfoBuild(),
            SizedBox(height: 1.5.h),
            orderDetailBuild(),
            SizedBox(height: 1.5.h),
            paymentDetailBuild(),
            1.vSpace,
            bottomBuild(),
            1.vSpace,
          ],
        ),
      ),
    );
  }

  Widget shippingAddressBuild() {
    return GeneralCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.vSpace,
          Text(
            'Shipping Address :',
            style: h3Style.copyWith(
              color: AppColor.greyDark.withOpacity(.7),
              fontSize: 15.sp,
            ),
          ),
          1.vSpace,
          Text('19010 Thornridge cir. shiloh, hawaii 81063',
              style: h3Style.copyWith(fontSize: 15.sp)),
          2.vSpace,
          Text(
            'Delivery Address :',
            style: h3Style.copyWith(
              color: AppColor.greyDark.withOpacity(.7),
              fontSize: 15.sp,
            ),
          ),
          1.vSpace,
          Text('Logistics Avenue, Suite 567 Freight City',
              style: h3Style.copyWith(fontSize: 15.sp)),
          1.vSpace,
        ],
      ),
    );
  }

  Widget driverInfoBuild() {
    return GeneralCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(),
              2.hSpace,
              Text(
                'Samuel Bardic',
                style: h3Style.copyWith(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColor.lightBlue,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.phone,
                    color: AppColor.primaryColor.withOpacity(.8),
                    size: 2.h,
                  ),
                ),
              ),
              2.hSpace,
              CircleAvatar(
                backgroundColor: AppColor.lightBlue,
                child: IconButton(
                  onPressed: () => Get.to(() => ChatScreen()),
                  icon: SvgPicture.asset(
                    AppAsset.chatIcon,
                    height: 1.9.h,
                  ),
                ),
              ),
            ],
          ),
          1.vSpace,
          Text('Vehicle number',
              style: h3Style.copyWith(
                  fontSize: 16.sp, fontWeight: FontWeight.normal)),
          Text('ZAE-9875643',
              style: h3Style.copyWith(
                  color: AppColor.greyDark.withOpacity(.7),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  Widget orderDetailBuild() {
    return GeneralCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order details', style: h3Style.copyWith(fontSize: 15.sp)),
          2.vSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 45.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: .5.h),
                        Text('06 Mar 2024',
                            style: h3Style.copyWith(fontSize: 14.5.sp)),
                        1.vSpace,
                        Text('Ref ld',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: .5.h),
                        Text('2031202623',
                            style: h3Style.copyWith(fontSize: 14.5.sp)),
                        1.vSpace,
                        Text('Delivery status',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: .5.h),
                        Text('Delivery',
                            style: h3Style.copyWith(
                                color: AppColor.primaryColor,
                                fontSize: 14.5.sp)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: .5.h),
                        Text('Heavy duty',
                            style: h3Style.copyWith(fontSize: 14.5.sp)),
                        SizedBox(height: .5.h),
                        Text('Time',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        1.vSpace,
                        Text('10:30 AM',
                            style: h3Style.copyWith(fontSize: 14.5.sp)),
                        1.vSpace,
                        Text('Lorry',
                            style: h3Style.copyWith(
                                color: AppColor.greyDark.withOpacity(.7),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: .5.h),
                        Text('Container truck',
                            style: h3Style.copyWith(fontSize: 14.5.sp)),
                        1.vSpace
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//

Widget paymentDetailBuild() {
  return GeneralCard(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Payment details', style: h3Style.copyWith(fontSize: 15.5.sp)),
      2.vSpace,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Package Total', style: h3Style.copyWith(fontSize: 15.sp)),
          Text('\$500.00', style: h3Style.copyWith(fontSize: 15.sp)),
        ],
      ),
      1.vSpace,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delivery Charge', style: h3Style.copyWith(fontSize: 15.sp)),
          Text('\$50.00', style: h3Style.copyWith(fontSize: 15.sp)),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: const Divider(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total', style: h3Style.copyWith(fontSize: 15.sp)),
          Text('\$550.00', style: h3Style.copyWith(fontSize: 15.sp)),
        ],
      ),
    ],
  ));
}

//
Widget bottomBuild() {
  return Padding(
    padding: pagePadding,
    child: Row(
      children: [
        Expanded(
            child: AppButton(
          color: Colors.white,
          text: 'Cancel order',
          textColor: Colors.black87,
          borderColor: AppColor.greyBorder,
          onPressed: () => Get.defaultDialog(
              title: '',
              content: CancelDialog(
                onCancel: () {},
                onNo: () {},
              )),
          padding: EdgeInsets.all(0.sp),
        )),
        4.hSpace,
        Expanded(
            child: AppButton(
          text: 'Track order',
          onPressed: () => Get.to(() => const LiveTrackingScreen()),
          padding: EdgeInsets.all(12.sp),
        )),
      ],
    ),
  );
}
