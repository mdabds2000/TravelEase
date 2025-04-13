import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';
import 'package:truck_ease/src/view/widget/delete_dialogue.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Delete account',
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.vSpace,
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange[900],
                  child: Text(
                    'j',
                    style: h3Style.copyWith(color: Colors.white),
                  ),
                ),
                2.hSpace,
                Text(
                  'leonardojaime374@gmail.com',
                  style: h4Style,
                ),
              ],
            ),
            3.vSpace,
            Text(
              'When you delete your account, You will delete your email, phone number, debit and credit card info, and addresses. You will no longer be able to book truck using truck bookit',
              style: h4Style,
            ),
            3.vSpace,
            Text(
              'This action can\'t be undone',
              style: h4Style,
            ),
            const Spacer(),
            AppButton(
              text: 'Delete account',
              onPressed: () => Get.defaultDialog(
                  title: '',
                  content: CancelDialog(
                    onCancel: () {},
                    onNo: () {},
                  )),
            ),
            5.vSpace,
          ],
        ),
      ),
    );
  }
}
