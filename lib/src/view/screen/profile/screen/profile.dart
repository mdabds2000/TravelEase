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
import 'package:travel_ease/src/view/screen/profile/screen/edit_profile.dart';
import 'package:travel_ease/src/view/screen/profile/screen/fav.dart';
import 'package:travel_ease/src/view/screen/profile/screen/privacy_policy.dart';
import 'package:travel_ease/src/view/screen/profile/screen/settings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            1.vSpace,
            Text(
              'Profile',
              style: h3Style,
            ),
            3.vSpace,
            CircleAvatar(
              radius: 30.sp,
            ),
            3.vSpace,
            Text(
              'Leonardo Jaime',
              style: h3Style,
            ),
            1.vSpace,
            Text(
              'leonardojaime374@gmail.com',
              style: h4Style.copyWith(color: AppColor.black.withOpacity(.6)),
            ),
            4.vSpace,
            tileBuild('My Profile',
                onTap: () => Get.to(() => const EditProfileScreen())),
            1.vSpace,
            tileBuild(
              'Favorites',
              onTap: () => Get.to(() => const FavoritesScreen()),
            ),
            1.vSpace,
            tileBuild('Privacy Policy',
                onTap: () => Get.to(() => const PrivacyPolicyScreen())),
            1.vSpace,
            tileBuild('Setting',
                onTap: () => Get.to(() => const SettingScreen())),
            1.vSpace,
            tileBuild('Log Out', onTap: () {}),
            1.vSpace,
          ],
        ),
      ),
    );
  }

  Widget tileBuild(String title, {required Function() onTap}) {
    return Container(
      margin: pagePadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: SvgPicture.asset(
            AppAsset.profileTab,
            color: Colors.black.withOpacity(.8),
          ),
        ),
        title: Text(
          title,
          style: h4Style,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black.withOpacity(.6),
          size: 21.sp,
        ),
      ),
    );
  }
}
