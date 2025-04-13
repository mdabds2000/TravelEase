import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/src/controller/profile_controller.dart';

class ChangeProfileWidget extends StatelessWidget {
  const ChangeProfileWidget({
    super.key,
  });

  void _showImagePickerOptions(
      BuildContext context, ProfileController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from gallery'),
                onTap: () {
                  controller.pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a photo'),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Center(
      child: GestureDetector(
        onTap: () => _showImagePickerOptions(context, controller),
        child: SizedBox(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.black),
                  ),
                  padding: EdgeInsets.all(10.sp),
                  child: CircleAvatar(
                    backgroundColor: AppColor.greyLight,
                    radius: 30.sp,
                    backgroundImage: controller.selectedImagePath.value.isEmpty
                        ? const AssetImage(AppAsset.photoBg) as ImageProvider
                        : FileImage(File(controller.selectedImagePath.value)),
                  ),
                );
              }),
              SvgPicture.asset(
                AppAsset.cameraIcon,
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
