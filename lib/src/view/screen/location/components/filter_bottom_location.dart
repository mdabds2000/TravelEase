import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/controller/app_controller.dart';
import 'package:truck_ease/src/controller/location_controller.dart';
import 'package:truck_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';
import 'package:truck_ease/src/view/widget/calender_picker.dart';
import 'package:truck_ease/src/view/widget/time_picker.dart';

class FilterLocationBottomWidget extends StatefulWidget {
  const FilterLocationBottomWidget({super.key});

  @override
  State<FilterLocationBottomWidget> createState() =>
      _FilterLocationBottomWidgetState();
}

class _FilterLocationBottomWidgetState
    extends State<FilterLocationBottomWidget> {
  AppController get ap => Get.put(AppController());

  LocationController get lc => Get.put(LocationController());

  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          2.vSpace,
          Padding(
            padding: pagePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select your route',
                  style: h3Style,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(AppAsset.greyCrossIcon),
                ),
              ],
            ),
          ),
          1.vSpace,
          Divider(color: AppColor.greyBorder),
          2.vSpace,
          Padding(
            padding: pagePadding,
            child: Column(
              children: [
                AuthField(
                  focusNode: _focusScopeNode,
                  onTap: () => _focusScopeNode.unfocus(),
                  controller: lc.locationController,
                  hintText: lc.locationController.text.isEmpty
                      ? 'Pickup location'
                      : lc.locationController.text,
                  isLabelStyle: false,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(13.0.sp),
                    child: SvgPicture.asset(AppAsset.locationIcon),
                  ),
                ),
                3.vSpace,
                AuthField(
                  focusNode: _focusScopeNode,
                  onTap: () => _focusScopeNode.unfocus(),
                  controller: lc.locationController,
                  hintText: lc.locationController.text.isEmpty
                      ? 'Pickup location'
                      : lc.locationController.text,
                  isLabelStyle: false,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(13.0.sp),
                    child: SvgPicture.asset(AppAsset.locationIcon),
                  ),
                ),
                3.vSpace,
                Obx(() {
                  return AuthField(
                    focusNode: _focusScopeNode,
                    onTap: () {
                      _focusScopeNode.unfocus();

                      return Get.bottomSheet(bottomSheetBuilder(ap, lc));
                    },
                    controller: TextEditingController(text: ''),
                    hintText: ap.dateBeenSelected.value == false
                        ? 'Select Date'
                        : ap.formattedDay,
                    isLabelStyle: false,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(13.0.sp),
                      child: SvgPicture.asset(AppAsset.calender2Icon),
                    ),
                  );
                }),

                3.vSpace,
                Obx(() => AuthField(
                      focusNode: _focusScopeNode,
                      onTap: () => _focusScopeNode.unfocus(),
                      controller: TextEditingController(text: ''),
                      hintText: ap.timeBeenSelected.value == false
                          ? 'Select Time'
                          : "${ap.hour.value.toString().padLeft(2, '0')}:${ap.minute.value.toString().padLeft(2, '0')} ${ap.period.value}",
                      key: ValueKey<String>(
                          "${ap.hour.value}:${ap.minute.value}:${ap.period.value}"),
                      isLabelStyle: false,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(13.0.sp),
                        child: SvgPicture.asset(AppAsset.busIcon),
                      ),
                    )),
                3.vSpace,
                AppButton(
                    text: 'Find truck',
                    onPressed: () {},
                    color: AppColor.greyLight)
                //  CalenderPickerWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget bottomSheetBuilder(ap, lc) {
  return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: 100.h,
      width: 100.w,
      child: Obx(() => Column(
            children: [
              2.vSpace,
              Padding(
                padding: pagePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lc.showTime.value ? 'Select time' : 'Select date',
                      style: h3Style,
                    ),
                    InkWell(
                      onTap: () {
                        lc.resetTimeState();
                        Get.back();
                      },
                      child: SvgPicture.asset(AppAsset.greyCrossIcon),
                    ),
                  ],
                ),
              ),
              1.vSpace,
              const Divider(),
              2.vSpace,
              lc.showTime.value ? timeBuild(lc, ap) : calenderBuild(lc),

              //Obx(() => Text(ap.formattedDay.toString()))
            ],
          )));
}

Widget calenderBuild(lc) {
  return Padding(padding: pagePadding, child: CalenderPickerWidget());
}

Widget timeBuild(lc, ap) {
  return Container(
    margin: pagePadding,
    padding: pagePadding,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColor.greyBorder),
    ),
    child: Column(
      children: [
        4.vSpace,
        const CustomTimePicker(),
        4.vSpace,
        AppButton(
            text: 'Select',
            onPressed: () {
              lc.resetTimeState();
              ap.timeSelected();

              Get.back();
            }),
        3.vSpace,
      ],
    ),
  );
}
