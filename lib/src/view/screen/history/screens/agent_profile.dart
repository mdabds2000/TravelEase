import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';

class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: AppColor.bgColor.withOpacity(.0),
        title: Text(
          'Agent profile',
          style: h3Style.copyWith(letterSpacing: .5),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 20.sp))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          3.vSpace,
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 30.sp,
            ),
          ),
          2.vSpace,
          Text(
            'Austin Arthur',
            style: h3Style.copyWith(fontWeight: FontWeight.normal),
          ),
          1.vSpace,
          Text(
            '+1 (154) 365 - 23156',
            style: h3Style.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.greyDark,
                fontSize: 16.sp),
          ),
          4.vSpace,
          Container(
            color: Colors.white.withOpacity(.85),
            child: Row(
              children: [
                1.hSpace,
                IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 18.sp,
                      backgroundColor: AppColor.lightBlue,
                      child: SvgPicture.asset(AppAsset.addContact),
                    )),
                3.hSpace,
                Text(
                  'Add to contacts',
                  style: h3Style.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 15.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
