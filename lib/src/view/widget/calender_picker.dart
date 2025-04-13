import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/src/controller/app_controller.dart';
import 'package:travel_ease/src/controller/location_controller.dart';

class CalenderPickerWidget extends StatelessWidget {
  final AppController controller = Get.put(AppController());
  final LocationController lc = Get.put(LocationController());

  CalenderPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: Obx(() {
        return CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            selectedDayHighlightColor: AppColor.primaryColor.withOpacity(.75),
            weekdayLabels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            weekdayLabelTextStyle: h4Style,
            dayTextStyle: h3Style.copyWith(fontSize: 15.sp),
            selectedDayTextStyle:
                h3Style.copyWith(fontSize: 15.sp, color: Colors.white),
          ),
          value: [controller.selectedDate.value],
          onValueChanged: (dates) {
            if (dates.isNotEmpty) {
              controller.updateDate(dates[0]);
              lc.showTimeState();
              controller.dateSelected();
            }
          },
        );
      }),
    );
  }
}
