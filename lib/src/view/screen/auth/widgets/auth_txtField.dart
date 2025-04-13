import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';

// ignore: must_be_immutable
class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? icon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final bool? isLabelStyle;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  Function()? onTap;

  AuthField(
      {super.key,
      this.isPassword = false,
      required this.controller,
      required this.hintText,
      this.focusNode,
      this.labelText,
      this.isLabelStyle = false,
      this.icon,
      this.isEnabled = true,
      this.keyboardType,
      this.suffixIcon,
      this.onTap,
      this.prefixIcon,
      this.validator});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  String? errorText;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (errorText != null) {
        setState(() {
          errorText = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          enabled: widget.isEnabled,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? isObscure : false,
          onChanged: (value) {
            setState(() {
              errorText = widget.validator?.call(value);
            });
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                h4Style.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
            labelText: widget.labelText,
            labelStyle: h4Style.copyWith(
              fontSize: 15.sp,
              color: widget.isEnabled ? AppColor.greyDark : AppColor.greyLight,
              fontWeight: FontWeight.w500,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.greyLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.errRed)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.errRed)),
            prefixIcon: widget.prefixIcon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: SvgPicture.asset(
                      isObscure ? AppAsset.passwordIcon : AppAsset.eye,
                      color: AppColor.primaryColor,
                    ),
                  )
                : widget.suffixIcon,
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
