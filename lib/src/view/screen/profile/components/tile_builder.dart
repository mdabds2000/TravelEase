import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';

class TileBuilderWidget extends StatelessWidget {
  Function()? onTap;
  final String title;
  final String? icon;
  bool? showIcon;
  TileBuilderWidget(
      {super.key,
      required this.onTap,
      required this.title,
      this.icon,
      this.showIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: ListTile(
        onTap: onTap,
        leading: showIcon == true
            ? SvgPicture.asset(
                icon!,
                color: Colors.black.withOpacity(.8),
              )
            : null,
        title: Text(
          title,
          style: h4Style,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black.withOpacity(.6),
          size: 21.sp,
        ),
      ),
    );
  }
}
