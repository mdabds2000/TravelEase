import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/auth/screens/login.dart';
import 'package:travel_ease/src/view/screen/auth/screens/sign_up.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              2.vSpace,
              Center(child: SvgPicture.asset(AppAsset.authIcon)),
              3.vSpace,
              Text(
                'Welcome to Travel Ease',
                style: h3Style.copyWith(letterSpacing: 1),
              ),
              2.vSpace,
              Padding(
                padding: pagePadding,
                child: Text(
                  'Create your account to get started on your travel booking journey.',
                  style: h3Style.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                      color: AppColor.greyDark),
                  textAlign: TextAlign.center,
                ),
              ),
              3.vSpace,
              authBtnWidget(
                  text: 'Continue with Google',
                  icon: AppAsset.googleIcon,
                  onpressed: () {}),
              2.vSpace,
              authBtnWidget(
                  text: 'Continue with Facebook',
                  icon: AppAsset.fbIcon,
                  onpressed: () {}),
              2.vSpace,
              authBtnWidget(
                  text: 'Continue with Apple',
                  icon: AppAsset.appleIcon,
                  onpressed: () {}),
              2.vSpace,
              authBtnWidget(
                  text: 'Continue with Email',
                  icon: AppAsset.mailIcon,
                  onpressed: () => Get.to(const SignUpScreen())),
              3.vSpace,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Already have an account? ',
                    style: h3Style.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 15.sp)),
                TextSpan(
                    text: 'Login',
                    style: h3Style.copyWith(
                        color: AppColor.secondaryColor, fontSize: 15.sp),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const LoginScreen())),
              ])),
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton authBtnWidget(
      {required String text,
      required String icon,
      required VoidCallback onpressed}) {
    return OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.grey),
          ),
        ),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 5.h,
            ),
            1.hSpace,
            Text(
              text,
              style: h3Style.copyWith(
                  fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
          ],
        ));
  }
}
