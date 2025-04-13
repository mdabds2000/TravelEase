import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/profile_controller.dart';
import 'package:travel_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/profile/components/change_profile.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

class EditProfileScreen extends GetWidget<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Edit profile',
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangeProfileWidget(),
              3.vSpace,
              Text(
                'Full name',
                style: h4Style.copyWith(color: AppColor.greyDark),
              ),
              1.vSpace,
              AuthField(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppAsset.profileTab,
                      color: Colors.grey,
                    ),
                  ),
                  controller: controller.nameController,
                  hintText: 'Jhone deo'),
              3.vSpace,
              Text(
                'Email',
                style: h4Style.copyWith(color: AppColor.greyDark),
              ),
              1.vSpace,
              AuthField(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppAsset.messageIcon,
                      color: Colors.grey,
                    ),
                  ),
                  controller: controller.emailController,
                  hintText: 'Jhonedeo@gmail.com'),
              3.vSpace,
              Text(
                'Phone Number',
                style: h4Style.copyWith(color: AppColor.greyDark),
              ),
              1.vSpace,
              AuthField(
                  suffixIcon:
                      const Icon(CupertinoIcons.phone, color: Colors.grey),
                  controller: controller.phoneController,
                  hintText: '(000) 000 - 0000'),
              10.vSpace,
              AppButton(
                text: 'Save',
                onPressed: () {},
                color: AppColor.btnStateOff,
              )
            ],
          ),
        ),
      ),
    );
  }
}
