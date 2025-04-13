import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:timeline_tile/timeline_tile.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';

class TimelineEvent {
  final String status;
  final String date;
  final bool isCompleted;

  TimelineEvent(
      {required this.status, required this.date, required this.isCompleted});
}

class CustomTimelineWidget extends StatelessWidget {
  final List<TimelineEvent> events;

  const CustomTimelineWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Column(
          children: [
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: index == 0,
              isLast: index == events.length - 1,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: event.isCompleted ? AppColor.primaryColor : Colors.grey,
              ),
              beforeLineStyle: LineStyle(
                color: AppColor.secondaryColor,
                thickness: 2,
              ),
              afterLineStyle: index != events.length - 1
                  ? LineStyle(
                      color: AppColor.secondaryColor,
                      thickness: 2,
                    )
                  : const LineStyle(
                      color: Colors.transparent,
                    ),
              endChild: Container(
                padding: EdgeInsets.only(top: 3.5.h, left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.status, style: h3Style),
                    1.vSpace,
                    Text(event.date,
                        style: h3Style.copyWith(
                            color: AppColor.greyDark.withOpacity(.7),
                            fontSize: 15.sp)),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
