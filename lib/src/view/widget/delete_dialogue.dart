import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

class CancelDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onNo;

  const CancelDialog({
    super.key,
    required this.onCancel,
    required this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAsset.delete),
        Text(
          'Are you sure about\ncanceling order',
          textAlign: TextAlign.center,
          style: h3Style.copyWith(
              fontSize: 16.sp, letterSpacing: 1, fontWeight: FontWeight.normal),
        ),
        3.vSpace,
        Row(
          children: [
            2.hSpace,
            Expanded(
              child: AppButton(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                color: AppColor.lightBlue,
                textStyle: h3Style.copyWith(
                    color: AppColor.secondaryColor, fontSize: 16.sp),
                text: 'No',
                onPressed: onNo,
              ),
            ),
            2.hSpace,
            Expanded(
              child: AppButton(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                text: 'Cancel',
                onPressed: onCancel,
              ),
            ),
            2.hSpace,
          ],
        ),
      ],
    );
  }
}
