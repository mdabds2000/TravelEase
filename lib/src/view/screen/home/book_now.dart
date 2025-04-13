import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';
import 'package:truck_ease/src/view/widget/calender_picker.dart';
import 'package:truck_ease/src/view/widget/time_picker.dart';

import 'payment_method.dart';

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({super.key});

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Select Date & Time',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CalenderPickerWidget(),
            2.vSpace,
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.greyBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.vSpace,
                    Padding(
                      padding: leftPadding,
                      child: Text(
                        'Select time',
                        style: h3Style,
                      ),
                    ),
                    1.vSpace,
                    const Divider(),
                    2.vSpace,
                    const CustomTimePicker(),
                    2.vSpace,
                  ],
                )),
            3.vSpace,
            AppButton(
                text: 'Continue',
                onPressed: () {
                  // if (_dates[0] != null) {
                  //   print('Selected date: ${_dates[0]}');
                  Get.to(const PaymentMethodScreen());
                  //  }
                  //  else {
                  //   print('No date selected');
                  // }
                }),
          ],
        ),
      ),
    );
  }
}

class CalenderWidget {}
