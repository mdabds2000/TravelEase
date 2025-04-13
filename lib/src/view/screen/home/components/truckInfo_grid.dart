import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';

class TruckInfoGrid extends StatelessWidget {
  const TruckInfoGrid({super.key});

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 3,
      ),
      itemBuilder: (context, index) {
        return truckInfoBuild(
          imageUrl: isPrime(index)
              ? 'https://wallpapers.com/images/hd/black-volvo-cool-truck-cdvn4ttk7o8geggz.jpg'
              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb-BUyZ7LWjGuX6I6ZGC7gxlBQfus9o6RkDg&s', // Placeholder image URL
          title: 'Truck $index',
          subtitle: 'Subtitle $index',
        );
      },
    );
  }
}

Widget truckInfoBuild({
  required String imageUrl,
  required String title,
  required String subtitle,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColor.greyBorder!),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          1.vSpace,
          Text(title, style: h3Style.copyWith(fontSize: 15.sp)),
          SizedBox(height: .5.h),
          Text(subtitle,
              style:
                  h4Style.copyWith(color: Colors.grey[600], fontSize: 14.sp)),
          1.vSpace,
        ],
      ),
    ),
  );
}
