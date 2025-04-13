import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Function()? ontap;
  final Function(String)? onChanged;

  TextEditingController? controller;

  SearchTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.focusNode,
    this.ontap,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.greyBorder.withOpacity(.2),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        onTap: ontap,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.sp,
            color: AppColor.greyDark,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: prefixIcon ?? SvgPicture.asset(AppAsset.searchIcon),
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.8.h),
        ),
      ),
    );
  }
}
