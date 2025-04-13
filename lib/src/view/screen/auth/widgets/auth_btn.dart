import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';

class AuthButton extends StatelessWidget {
  final Color? bgColor;
  final String icon;
  final Function() onPressed;
  const AuthButton(
      {super.key,
      required this.bgColor,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.white24,
      elevation: 0,
      color: bgColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: .8.h),
        child: Image.asset(
          icon,
          color: icon == AppAsset.appleIcon ? Colors.white : null,
          height: 3.h,
        ),
      ),
    );
  }
}
