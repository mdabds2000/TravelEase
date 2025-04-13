import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/controller/truck_controller.dart';
import 'package:truck_ease/src/model/popularTrucks_model.dart';
import 'package:truck_ease/src/view/screen/home/truck_detail.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class TruckCardWidget extends StatelessWidget {
  final PopularTruckModel truckModel;
  TruckCardWidget({super.key, required this.truckModel});
  final TruckController truckController = Get.put(TruckController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: pagePadding,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: AppColor.greyBorder)),
          child: Column(
            children: [
              1.vSpace,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 5.h,
                      width: 12.w,
                      child: Image.network(
                        truckModel.truckImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  2.hSpace,
                  Text(
                    truckModel.truckName,
                    style: h2Style.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.normal),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () =>
                          truckController.toggleFavorite(truckModel),
                      icon: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.greyBorder)),
                        child: Obx(() => SvgPicture.asset(
                            truckController.isFavorite(truckModel)
                                ? AppAsset.redHeartIcon
                                : AppAsset.heartIcon)),
                      )),
                ],
              ),
              1.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 6.h,
                    width: 38.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick - Up',
                          style: h3Style.copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: .5.h),
                        Text(
                          truckModel.pickUpTime,
                          style: h3Style.copyWith(
                              fontSize: 13.5.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h, child: const VerticalDivider()),
                  2.hSpace,
                  Expanded(
                    child: SizedBox(
                      height: 6.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Drop Off',
                            style: h3Style.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: .5.h),
                          Text(
                            truckModel.dropTime,
                            style: h3Style.copyWith(
                                fontSize: 13.5.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              2.vSpace,
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                    color: Colors.white,
                    text: 'Details',
                    textColor: AppColor.secondaryColor,
                    borderColor: AppColor.greyBorder,
                    onPressed: () => Get.to(TruckDetailScreen(
                      truckModel: truckModel,
                    )),
                    padding: EdgeInsets.all(12.sp),
                  )),
                  4.hSpace,
                  Expanded(
                      child: AppButton(
                    text: 'Book now',
                    onPressed: () {},
                    padding: EdgeInsets.all(12.sp),
                  )),
                ],
              ),
              2.vSpace,
            ],
          ),
        ),
      ],
    );
  }
}
