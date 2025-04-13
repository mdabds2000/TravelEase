import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/bottom.dart';
import 'package:truck_ease/src/view/screen/home/components/appbar.dart';
import 'package:truck_ease/src/view/screen/home/home.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int? _selectedValue;

  List<Map<String, dynamic>> paymentMethods = [
    {
      'icon': AppAsset.paypalIcon,
      'title': 'Paypal',
    },
    {
      'icon': AppAsset.visaIcon,
      'title': 'Visa',
    },
    {
      'icon': AppAsset.googlePayIcon,
      'title': 'Google Pay',
    },
    {
      'icon': AppAsset.applePayIcon,
      'title': 'Apple Pay',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(isEnabled: false, title: 'Payment Method'),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.vSpace,
            Text(
              'Select payment method',
              style: h3Style.copyWith(
                  fontSize: 16.sp, color: Colors.black87, letterSpacing: 1),
            ),
            1.vSpace,
            Expanded(
              child: ListView.separated(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColor.greyBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        paymentMethods[index]['icon'],
                        height: 3.h,
                      ),
                      title: Text(paymentMethods[index]['title']),
                      trailing: Radio<int>(
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.primaryColor,
                        ),
                        focusColor: Colors.red,
                        hoverColor: Colors.amber,
                        value: index,
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedValue = value;
                            Get.defaultDialog(
                                backgroundColor: Colors.white,
                                content: dialogBuild(),
                                title: '');
                          });
                        },
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors
                                .red // Change redColor to your desired color
                            ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 1.vSpace,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$540.00',
                  style: h3Style.copyWith(fontSize: 16.sp),
                ),
                AppButton(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    width: 37.w,
                    text: 'Pay Now',
                    onPressed: () {}),
              ],
            ),
            4.vSpace,
          ],
        ),
      ),
    );
  }
}

Widget dialogBuild() {
  return Column(
    children: [
      SvgPicture.asset(AppAsset.paymentSucessIcon),
      2.vSpace,
      Text(
        'Truck booking sucess',
        style: h3Style.copyWith(fontSize: 16.sp, letterSpacing: 1),
      ),
      1.vSpace,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'You have sucessfully booking your truck please wait for date. go to home',
          textAlign: TextAlign.center,
          style: h4Style.copyWith(
              fontSize: 14.sp, color: AppColor.greyDark.withOpacity(.7)),
        ),
      ),
      3.vSpace,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: AppButton(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            text: 'Go to home',
            onPressed: () => Get.to(CustomBottomBar())),
      ),
      2.vSpace,
    ],
  );
}
