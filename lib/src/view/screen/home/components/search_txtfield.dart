import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';

class TxtField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? icon;
  final TextInputType? keyboardType;
  final String suffixIcon;
  final bool isEnabled;
  Function()? ontap;
  FocusNode? focusNode;

  TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    this.icon,
    this.isEnabled = true,
    this.keyboardType,
    this.focusNode,
    this.ontap,
  });

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.ontap,
      focusNode: widget.focusNode,
      enabled: widget.isEnabled,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: h4Style.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.greyDark,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColor.greyLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 1.h),
        suffixIcon: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: SvgPicture.asset(
            widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
