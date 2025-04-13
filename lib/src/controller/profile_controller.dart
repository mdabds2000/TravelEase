import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truck_ease/src/controller/user_controller.dart';

class ProfileController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var selectedImagePath = ''.obs;

  @override
  void onInit() {
    nameController.text = currentUser.name;
    emailController.text = currentUser.email;
    phoneController.text = currentUser.phoneNumber;
    super.onInit();
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  var uc = Get.find<UserController>();
  Future<void> saveData() async {
    return await uc.updateUser(currentUser.copyWith(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      profilePic: selectedImagePath.value,
    ));
  }
}
