import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final Color? color;
  final Color? borderColor;
  final String text;
  final double? buttonRoundness;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  const AppButton({
    super.key,
    this.width,
    this.color,
    required this.text,
    this.buttonRoundness,
    this.textColor,
    this.textStyle,
    required this.onPressed,
    this.borderColor,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: width ?? 100.w,
      onPressed: isLoading ? null : onPressed,
      color: color ?? AppColor.primaryColor.withOpacity(.85),
      textColor: textColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(buttonRoundness ?? 30.0),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(15.0.sp),
        child: isLoading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text,
                style: textStyle ??
                    h3Style.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: 16.sp,
                    ),
              ),
      ),
    );
  }
}
