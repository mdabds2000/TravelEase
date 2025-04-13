import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/profile/components/tile_builder.dart';
import 'package:travel_ease/src/view/screen/profile/screen/change_password.dart';
import 'package:travel_ease/src/view/screen/profile/screen/delete_account.dart';

import 'help_center.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Settings',
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            3.vSpace,
            TileBuilderWidget(
              onTap: () => Get.to(() => const ChangePasswordScreen()),
              title: 'Change password',
              icon: AppAsset.lock,
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () {},
              title: 'Term & Conditions',
              icon: AppAsset.privacy,
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () => Get.to(() => const HelpCenterScreen()),
              title: 'Help center',
              icon: AppAsset.help,
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () => Get.to(() => const DeleteAccountScreen()),
              title: 'Delete account',
              icon: AppAsset.trash,
            ),
          ],
        ),
      ),
    );
  }
}
