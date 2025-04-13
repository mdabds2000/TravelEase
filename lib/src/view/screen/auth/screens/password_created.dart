import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/bottom.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

class PasswordCreatedScreen extends StatelessWidget {
  const PasswordCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            10.vSpace,
            Text('Your password has been created.',
                style: h3Style.copyWith(letterSpacing: 1.2)),
            2.vSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                'Your password ha been reset created! Now login with your new password.',
                style: h4Style.copyWith(color: AppColor.greyDark),
                textAlign: TextAlign.center,
              ),
            ),
            10.vSpace,
            Center(child: SvgPicture.asset(AppAsset.sucessIcon)),
            // 35.vSpace,
            const Spacer(),
            Padding(
              padding: pagePadding,
              child: AppButton(
                  text: 'Home', onPressed: () => Get.offAll(CustomBottomBar())),
            ),
            5.vSpace,
          ],
        ),
      ),
    );
  }
}
