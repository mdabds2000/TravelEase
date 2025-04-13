import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/src/controller/location_controller.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({
    super.key,
    required this.lc,
  });

  final LocationController lc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Searches', style: h3Style.copyWith(fontSize: 17.5.sp)),
            GestureDetector(
              onTap: () {
                lc.clearRecentSearch();
              },
              child: Text(
                'Clear all',
                style: h3Style.copyWith(
                    color: AppColor.secondaryColor,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: lc.recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    AppAsset.searchIcon,
                    color: AppColor.greyDark,
                  ),
                  title: Text(
                    lc.recentSearches[index],
                    style: h3Style.copyWith(
                        color: AppColor.black.withOpacity(.9),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  onTap: () {},
                );
              },
            )),
      ],
    );
  }
}
