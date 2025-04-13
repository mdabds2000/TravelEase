import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/src/model/popularTrucks_model.dart';
import 'package:travel_ease/src/view/screen/home/components/truck_detail_widget.dart';

class TruckDetailScreen extends StatelessWidget {
  final PopularTruckModel truckModel;

  const TruckDetailScreen({super.key, required this.truckModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: 100.w,
                height: 30.h,
                child: Image.network(
                  truckModel.truckImg,
                  fit: BoxFit.cover,
                )),
          ),
          TruckDetailWidget(
            truckModel: truckModel,
          ),
        ],
      ),
    );
  }
}
