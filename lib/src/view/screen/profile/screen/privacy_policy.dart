import 'package:flutter/material.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';

import '../../home/components/appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Privacy plolicy',
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.vSpace,
            Text(
              '1. Types of data we collect',
              style: h3Style,
            ),
            2.vSpace,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type. ',
              style:
                  h4Style.copyWith(color: Colors.grey[600], letterSpacing: 1),
            ),
            4.vSpace,
            Text(
              '2. Use of your personal data',
              style: h3Style,
            ),
            2.vSpace,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type. ',
              style:
                  h4Style.copyWith(color: Colors.grey[600], letterSpacing: 1),
            ),
            4.vSpace,
            Text(
              '3. Disclosure of your personal data',
              style: h3Style,
            ),
            2.vSpace,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type. ',
              style:
                  h4Style.copyWith(color: Colors.grey[600], letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
