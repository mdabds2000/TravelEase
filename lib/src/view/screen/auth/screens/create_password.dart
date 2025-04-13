import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/auth/screens/password_created.dart';
import 'package:truck_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: SvgPicture.asset(AppAsset.backIcon)),
              ),
              6.vSpace,
              Text('Create a New Password',
                  style: h3Style.copyWith(letterSpacing: 1.2)),
              2.vSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Set the new password for your account so you can login and access all the features.',
                  style: h4Style.copyWith(color: AppColor.greyDark),
                  textAlign: TextAlign.center,
                ),
              ),
              4.vSpace,
              Padding(
                padding: pagePadding,
                child: Column(
                  children: [
                    AuthField(
                      controller: TextEditingController(text: ''),
                      hintText: 'Password (8+ characters)*',
                      labelText: 'New Password*',
                      isPassword: true,
                    ),
                    1.vSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Use at least 8 characters or more.',
                        style: h4Style.copyWith(color: AppColor.greyDark),
                      ),
                    ),
                    2.vSpace,
                    AuthField(
                      controller: TextEditingController(text: ''),
                      hintText: 'Password (8+ characters)*',
                      labelText: 'Confirm Password*',
                      isPassword: true,
                    ),
                    5.vSpace,
                    AppButton(
                        text: 'Submit',
                        onPressed: () =>
                            Get.off(const PasswordCreatedScreen())),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
