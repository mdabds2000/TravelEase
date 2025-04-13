import 'package:flutter/material.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/home/components/popularTruck_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          isEnabled: false,
          title: 'Favorites',
        ),
        backgroundColor: AppColor.bgColor,
        body: ListView.separated(
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (_, index) {
            return TruckCardWidget(
              truckModel: popularTruck[index],
            );
          },
          separatorBuilder: (context, index) => 2.vSpace,
          itemCount: popularTruck.length,
        ));
  }
}
