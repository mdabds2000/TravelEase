import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Change Password',
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              3.vSpace,
              AuthField(
                controller: TextEditingController(text: ''),
                hintText: 'Current password',
                labelText: 'Password*',
                isPassword: true,
              ),
              2.vSpace,
              AuthField(
                controller: TextEditingController(text: ''),
                hintText: 'New password',
                labelText: 'New Password',
                isPassword: true,
              ),
              2.vSpace,
              passwordRequirmentBuild(),
              2.vSpace,
              AuthField(
                controller: TextEditingController(text: ''),
                hintText: 'Re-enter new password',
                labelText: 'Re-enter new password',
                isPassword: true,
              ),
              30.vSpace,
              AppButton(
                text: 'Change',
                onPressed: () => Get.dialog(dialogueBuild()),
                color: AppColor.btnStateOff,
              ),
              2.vSpace,
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: h4Style.copyWith(color: AppColor.primaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordRequirmentBuild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(),
        Text(
          'Password requirements:',
          style: h4Style.copyWith(fontSize: 15.sp),
        ),
        1.vSpace,
        Text(
          '• at least 12 characters',
          style: h4Style.copyWith(fontSize: 15.sp),
        ),
        Text(
          '• at least 1 number',
          style: h4Style.copyWith(fontSize: 15.sp),
        ),
        Text(
          '• at least 1 uppercase letter',
          style: h4Style.copyWith(fontSize: 15.sp),
        ),
        Text(
          '• at least 1 lowercase letter',
          style: h4Style.copyWith(fontSize: 15.sp),
        ),
      ],
    );
  }
}

Widget dialogueBuild() {
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAsset.paymentSucessIcon,
            height: 10.h,
          ),
          SizedBox(height: 3.h),
          Text(
            'Password changed successfully',
            style: h3Style,
            textAlign: TextAlign.center,
          ),
          Text(
            'Your password has been changed. Thanks for keeping your account safe.',
            style:
                h4Style.copyWith(color: AppColor.greyDark, fontSize: 14.5.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          AppButton(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              width: 35.w,
              text: 'Go to login',
              onPressed: () => Get.back())
        ],
      ),
    ),
  );
}
