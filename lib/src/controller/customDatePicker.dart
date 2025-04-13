import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerDialog1 extends StatelessWidget {
  final Function(DateRangePickerSelectionChangedArgs) onDateChanged;
  final DateRangePickerSelectionMode selectionMode;
  final DateTime? initialSelectedDate;
  final PickerDateRange? initialSelectedRange;

  const DatePickerDialog1({
    super.key,
    required this.onDateChanged,
    this.selectionMode = DateRangePickerSelectionMode.range,
    this.initialSelectedDate,
    this.initialSelectedRange,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Custom corner radius
      ),
      insetPadding: const EdgeInsets.all(16), // Add some padding
      clipBehavior: Clip.antiAlias, // Ensure smooth edges
      child: Column(
        mainAxisSize: MainAxisSize.min, // Fit the content
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  'Select Date',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          // Date Picker
          SizedBox(
            height: 300,
            width: 300,
            child: SfDateRangePicker(
              onSelectionChanged: onDateChanged,
              selectionMode: selectionMode,
              initialSelectedDate: initialSelectedDate,
              initialSelectedRange: initialSelectedRange,
              selectionColor: Theme.of(context).primaryColor,
              todayHighlightColor: Theme.of(context).primaryColor,
              rangeSelectionColor:
                  Theme.of(context).primaryColor.withOpacity(0.2),
              startRangeSelectionColor: Theme.of(context).primaryColor,
              endRangeSelectionColor: Theme.of(context).primaryColor,
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(), // Close dialog
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(), // Close dialog
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'OK',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
