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
import 'package:truck_ease/src/controller/truck_controller.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final truckController = Get.put(TruckController());
    return Container(
      height: 35.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: leftPadding,
                child: Text(
                  'Sort by',
                  style: h3Style.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 16.sp),
                ),
              ),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: const Color(0xffE6EEEF),
                      child: SvgPicture.asset(AppAsset.crossIcon))),
            ],
          ),
          Divider(
            color: Colors.grey[300],
          ),
          2.vSpace,
          Padding(
            padding: leftPadding,
            child: Text(
              'Select Size',
              style: h3Style.copyWith(
                  fontWeight: FontWeight.normal, fontSize: 16.sp),
            ),
          ),
          3.vSpace,
          SizedBox(
            height: 4.5.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Obx(() => GestureDetector(
                        onTap: () => truckController.changeSize(index),
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: truckController.selectedSize.value ==
                                      truckController.size[index]
                                  ? const Color(0xffE6EEEF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: truckController.selectedSize.value ==
                                          truckController.size[index]
                                      ? AppColor.primaryColor
                                      : AppColor.greyBorder)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Center(
                              child: Text(
                                truckController.size[index],
                                style: h3Style.copyWith(
                                    color: Colors.black, fontSize: 15.5.sp),
                              ),
                            ),
                          ),
                        ),
                      ));
                }),
          ),
          const Spacer(),
          Padding(
            padding: pagePadding,
            child: Row(
              children: [
                Expanded(
                    child: AppButton(
                  color: Colors.white,
                  text: 'Clear Filter',
                  textColor: Colors.black.withOpacity(.7),
                  borderColor: AppColor.greyBorder,
                  onPressed: () => truckController.clearFilter(),
                  padding: EdgeInsets.all(12.sp),
                )),
                4.hSpace,
                Expanded(
                    child: AppButton(
                  text: 'Apply',
                  onPressed: () {},
                  padding: EdgeInsets.all(12.sp),
                )),
              ],
            ),
          ),
          5.vSpace,
        ],
      ),
    );
  }
}
