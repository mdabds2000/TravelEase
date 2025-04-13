import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/home/components/search_txtfield.dart';
import 'package:travel_ease/src/view/screen/home/select_truck.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';
import 'package:travel_ease/src/view/widget/time_picker.dart';

import '../../../../controller/customDatePicker.dart';

class VehicleAvailabilityWidget extends StatefulWidget {
  const VehicleAvailabilityWidget({super.key});

  @override
  State<VehicleAvailabilityWidget> createState() =>
      _VehicleAvailabilityWidgetState();
}

class _VehicleAvailabilityWidgetState extends State<VehicleAvailabilityWidget> {
  late FocusNode _searchFocusNode;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _onDateChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      // Handle date range selection
      final PickerDateRange range = args.value;
      _dateController.text =
          '${range.startDate.toString().split(' ')[0]} - ${range.endDate.toString().split(' ')[0]}';
    } else if (args.value is DateTime) {
      // Handle single date selection
      final DateTime date = args.value;
      _dateController.text = date.toString().split(' ')[0];
    }
  }

  void _showDatePickerDialog() {
    _searchFocusNode.unfocus();
    showDialog(
      context: context,
      barrierDismissible: false, // Disable dismiss on outside tap
      builder: (context) {
        return DatePickerDialog1(
            onDateChanged: _onDateChanged,
            selectionMode: DateRangePickerSelectionMode
                .range, // or .single for single date
            initialSelectedRange: PickerDateRange(
              DateTime.now(),
              DateTime.now().add(const Duration(days: 7)),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pagePadding,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: AppColor.greyBorder)),
      child: Column(
        children: [
          2.vSpace,
          TxtField(
              controller: TextEditingController(text: ''),
              hintText: 'From Location',
              suffixIcon: AppAsset.locationIcon),
          2.vSpace,
          TxtField(
              controller: TextEditingController(text: ''),
              hintText: 'To Location',
              suffixIcon: AppAsset.locationIcon),
          2.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TxtField(
                    ontap: _showDatePickerDialog,
                    focusNode: _searchFocusNode,
                    controller: _dateController,
                    hintText: 'Select date',
                    suffixIcon: AppAsset.calenderIcon),
              ),
              2.hSpace,
              Expanded(
                child: TxtField(
                    ontap: () {
                      _searchFocusNode.unfocus();
                      Get.defaultDialog(
                          content: const CustomTimePicker(),
                          title: 'Select time');
                    },
                    controller: TextEditingController(text: ''),
                    hintText: 'Select time',
                    suffixIcon: AppAsset.clockIcon), // Changed to clock icon
              ),
            ],
          ),
          2.vSpace,
          // Additional Field for Vehicle Type
          TxtField(
              controller: TextEditingController(text: ''),
              hintText: 'Vehicle Type (Optional)',
              suffixIcon: AppAsset.chatIcon), // Assuming you have a car icon
          2.vSpace,
          AppButton(
            text: 'Check Availability',
            onPressed: () => Get.to(
                const SelectTruckScreen()), // You can change the navigation to a different screen if needed
          ),
          2.vSpace,
        ],
      ),
    );
  }
}
