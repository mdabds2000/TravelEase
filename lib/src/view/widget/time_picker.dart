import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/app_controller.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Hour Up Button
            Column(
              children: [
                CustomBtn(
                  icon: CupertinoIcons.chevron_up,
                  onPressed: appController.incrementHour,
                ),
                2.vSpace,
                Obx(() => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        appController.hour.value.toString().padLeft(2, '0'),
                        key: ValueKey<int>(appController.hour.value),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )),
                2.vSpace,
                CustomBtn(
                  icon: CupertinoIcons.chevron_down,
                  onPressed: appController.decrementHour,
                ),
              ],
            ),

            const Text(
              ":",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Minute Up Button
            Column(
              children: [
                CustomBtn(
                  icon: CupertinoIcons.chevron_up,
                  onPressed: appController.incrementMinute,
                ),
                2.vSpace,
                Obx(() => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        appController.minute.value.toString().padLeft(2, '0'),
                        key: ValueKey<int>(appController.minute.value),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )),
                2.vSpace,
                CustomBtn(
                  icon: CupertinoIcons.chevron_down,
                  onPressed: appController.decrementMinute,
                ),
              ],
            ),
            const Text(
              ":",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Column(
              children: [
                CustomBtn(
                  icon: CupertinoIcons.chevron_up,
                  onPressed: appController.togglePeriod,
                ),
                2.vSpace,
                Obx(() => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        appController.period.value,
                        key: ValueKey<String>(appController.period.value),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )),
                2.vSpace,
                CustomBtn(
                  icon: CupertinoIcons.chevron_down,
                  onPressed: appController.togglePeriod,
                ),
              ],
            ),
          ],
        ),
        2.vSpace,
        Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Text(
                "${appController.hour.value.toString().padLeft(2, '0')}:${appController.minute.value.toString().padLeft(2, '0')} ${appController.period.value}",
                key: ValueKey<String>(
                    "${appController.hour.value}:${appController.minute.value}:${appController.period.value}"),
                style: h3Style.copyWith(
                    color: AppColor.greyDark.withOpacity(.5), fontSize: 16.sp),
              ),
            )),
      ],
    );
  }
}

class CustomBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomBtn({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyBorder,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          icon,
          size: 17.sp,
        ),
      ),
    );
  }
}



// Setstate

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomTimePicker extends StatefulWidget {
//   const CustomTimePicker({super.key});

//   @override
//   _CustomTimePickerState createState() => _CustomTimePickerState();
// }

// class _CustomTimePickerState extends State<CustomTimePicker> {
//   late int hour;
//   late int minute;
//   late String period;

//   @override
//   void initState() {
//     super.initState();
//     DateTime now = DateTime.now();
//     hour = now.hour > 12 ? now.hour - 12 : now.hour;
//     minute = now.minute;
//     period = now.hour >= 12 ? "PM" : "AM";
//   }

//   void incrementHour() {
//     setState(() {
//       if (hour == 12) {
//         hour = 1;
//       } else {
//         hour++;
//       }
//     });
//   }

//   void decrementHour() {
//     setState(() {
//       if (hour == 1) {
//         hour = 12;
//       } else {
//         hour--;
//       }
//     });
//   }

//   void incrementMinute() {
//     setState(() {
//       if (minute == 59) {
//         minute = 0;
//         incrementHour();
//       } else {
//         minute++;
//       }
//     });
//   }

//   void decrementMinute() {
//     setState(() {
//       if (minute == 0) {
//         minute = 59;
//         decrementHour();
//       } else {
//         minute--;
//       }
//     });
//   }

//   void togglePeriod() {
//     setState(() {
//       period = period == "AM" ? "PM" : "AM";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Hour Up Button
//             Column(
//               children: [
//                 IconButton(
//                   onPressed: incrementHour,
//                   icon: Icon(CupertinoIcons.chevron_up),
//                 ),
//                 Text(
//                   hour.toString().padLeft(2, '0'),
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   onPressed: decrementHour,
//                   icon: Icon(CupertinoIcons.chevron_down),
//                 ),
//               ],
//             ),
//             // Separator
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 ":",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             // Minute Up Button
//             Column(
//               children: [
//                 IconButton(
//                   onPressed: incrementMinute,
//                   icon: Icon(CupertinoIcons.chevron_up),
//                 ),
//                 Text(
//                   minute.toString().padLeft(2, '0'),
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   onPressed: decrementMinute,
//                   icon: Icon(CupertinoIcons.chevron_down),
//                 ),
//               ],
//             ),
//             // Period Up Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 children: [
//                   IconButton(
//                     onPressed: togglePeriod,
//                     icon: Icon(CupertinoIcons.chevron_up),
//                   ),
//                   Text(
//                     period,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     onPressed: togglePeriod,
//                     icon: Icon(CupertinoIcons.chevron_down),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         Text(
//           "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period",
//           style: TextStyle(fontSize: 24, color: Colors.grey),
//         ),
//       ],
//     );
//   }
// }



