import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(
  String title,
  String message, {
  Color backgroundColor = Colors.red,
  Color textColor = Colors.white,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  Duration duration = const Duration(seconds: 3),
  bool isDismissible = true,
  Widget? icon,
  TextButton? mainButton,
  EdgeInsets margin = const EdgeInsets.all(10),
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    snackPosition: snackPosition,
    borderRadius: 10.0,
    margin: margin,
    duration: duration,
    isDismissible: isDismissible,
    dismissDirection: DismissDirection.down,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    icon: icon,
    mainButton: mainButton,
  );
}
