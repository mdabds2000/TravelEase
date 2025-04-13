import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';

class GeneralCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  const GeneralCard({super.key, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: pagePadding,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1.h),
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: child,
    );
  }
}
