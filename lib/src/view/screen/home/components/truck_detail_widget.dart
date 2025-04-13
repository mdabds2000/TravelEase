import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/model/popularTrucks_model.dart';
import 'package:travel_ease/src/view/screen/home/book_now.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

class TruckDetailWidget extends StatelessWidget {
  final PopularTruckModel truckModel;

  const TruckDetailWidget({
    required this.truckModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 26.h,
      child: Container(
        padding: pagePadding,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: 100.w,
        child: Column(
          children: [
            2.vSpace,
            truckInfoBuild(),
            SizedBox(height: 1.5.h),
            truckDescriptionBuild(),
            SizedBox(height: 1.5.h),
            driverInfoBuild(),
            2.vSpace,
            AppButton(
                text: 'Book now',
                onPressed: () => Get.to(const BookNowScreen()))
          ],
        ),
      ),
    );
  }

  Widget truckInfoBuild() {
    return Container(
      padding: pagePadding,
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColor.greyBorder)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.vSpace,
          Text(
            'Information',
            style: h3Style,
          ),
          SizedBox(height: 1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 45.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Loading Capacity',
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    1.vSpace,
                    Text('1000KG',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
                    1.vSpace,
                    Text('Size',
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    1.vSpace,
                    Text('Large',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
                    1.vSpace,
                    Text('Quantity',
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    1.vSpace,
                    Text('32 tons',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
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
                    1.vSpace,
                    Text('Heavy duty',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
                    1.vSpace,
                    Text('Price',
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    1.vSpace,
                    Text('\$650.10',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
                    1.vSpace,
                    Text('Lorry',
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    1.vSpace,
                    Text('Container truck',
                        style: h3Style.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 15.sp)),
                  ],
                ),
              ),
            ],
          ),
          2.vSpace,
        ],
      ),
    );
  }
}

Widget truckDescriptionBuild() {
  return Container(
    padding: pagePadding,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.greyBorder)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        1.vSpace,
        Text(
          'Description',
          style: h3Style,
        ),
        1.vSpace,
        Text(
            'Container trucks within delivery units are vital for boosting the efficiency of the entire container transport process. These trucks streamline the movement and handling of containers, making the workflow more effective. ',
            style: h3Style.copyWith(
                color: AppColor.greyDark.withOpacity(.7),
                fontSize: 15.sp,
                fontWeight: FontWeight.normal)),
        1.vSpace,
      ],
    ),
  );
}

Widget driverInfoBuild() {
  return Container(
    padding: pagePadding,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.greyBorder)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        1.vSpace,
        Row(
          children: [
            CircleAvatar(),
            2.hSpace,
            Text(
              'Samuel bardic',
              style: h3Style,
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
                    ))),
            2.hSpace,
            CircleAvatar(
                backgroundColor: AppColor.lightBlue,
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAsset.chatIcon,
                      height: 1.9.h,
                    )))
          ],
        ),
        1.vSpace,
        Text('Vehicle number',
            style: h3Style.copyWith(
                fontWeight: FontWeight.normal, fontSize: 16.sp)),
        1.vSpace,
        Text('ZAE-9875643',
            style: h3Style.copyWith(
                color: AppColor.greyDark.withOpacity(.7),
                fontSize: 15.sp,
                fontWeight: FontWeight.normal)),
        2.vSpace,
      ],
    ),
  );
}
