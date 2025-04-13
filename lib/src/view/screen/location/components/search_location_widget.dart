import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/controller/location_controller.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({
    super.key,
    required this.lc,
  });

  final LocationController lc;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: lc.searchResults.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => lc.selectedLocation(lc.searchResults[index]),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 100.w,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.greyBorder),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.greyLight.withOpacity(.15)),
                          child: SvgPicture.asset(AppAsset.locationIcon,
                              height: 22.sp, color: AppColor.black),
                        ),
                        4.hSpace,
                        Text(lc.searchResults[index],
                            style: h3Style.copyWith(
                                color: AppColor.black.withOpacity(.85),
                                fontSize: 16.sp,
                                letterSpacing: 1)),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.greyBorder,
                  )
                ],
              ),
            );
          },
        ));
  }
}
