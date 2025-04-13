import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const lightBlue = Color(0xffE6EEEF);
  static Color primaryColor = const Color(0xff003A3E);
  static Color secondaryColor = AppColor.primaryColor.withOpacity(.7);

  static Color bgColor = const Color(0xfff8f9fb);
  static Color transparentColor = const Color(0x00ffffff);
  static const black = Colors.black;

  static Color greyDark = Colors.grey[700]!;
  static Color greyLight = Colors.grey[400]!;
  static Color greyBorder = AppColor.greyLight.withOpacity(.5);

  static Color errRed = const Color(0xfff42e39);

  static Color btnStateOff = const Color(0xffC1C7D0);
}
