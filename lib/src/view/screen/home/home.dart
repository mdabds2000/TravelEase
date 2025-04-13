import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/home/components/popularTruck_widget.dart';
import 'package:truck_ease/src/view/screen/home/components/truck_location.dart';
import 'package:truck_ease/src/view/screen/home/popularTrucks.dart';

import 'add_vehicle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "User";
  List<Map<String, dynamic>> vehicles = []; // List to store vehicles

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadVehicles(); // Load vehicles from storage
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
    });
  }

  // Load vehicles from storage (you might want to use a database in real app)
  Future<void> _loadVehicles() async {
    // This is a placeholder - in a real app, you'd load from a database
    setState(() {
      vehicles = List.from(popularTruck); // Initialize with default data
    });
  }

  // Function to navigate to add vehicle screen
  void _navigateToAddVehicle() async {
    final result = await Get.to(() => const AddVehicleScreen());
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        vehicles.add(result); // Add the new vehicle to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddVehicle,
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.bgColor,
            expandedHeight: 15.h,
            floating: false,
            pinned: true,
            toolbarHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Hello,\n', style: h2Style),
                  TextSpan(text: '$userName 👋', style: h2Style),
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const VehicleAvailabilityWidget(),
                2.vSpace,
                _buildAddVehicleButton(), // Add vehicle button
                viewAllBuild(),
                vehicleList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVehicleButton() {
    return Padding(
      padding: pagePadding,
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton.icon(
          icon: Icon(Icons.add, color: AppColor.primaryColor),
          label: Text('Add Vehicle',
              style: h4Style.copyWith(color: AppColor.primaryColor)),
          onPressed: _navigateToAddVehicle,
        ),
      ),
    );
  }

  Widget vehicleList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: min(popularTruck.length, 2),
      itemBuilder: (_, index) {
        var truckData = popularTruck[index];
        return TruckCardWidget(truckModel: truckData);
      },
      separatorBuilder: (context, index) => 2.vSpace,
    );
  }

  Widget viewAllBuild() {
    return Padding(
      padding: pagePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Vehicles',
            style: h3Style.copyWith(fontSize: 16.sp),
          ),
          IconButton(
            onPressed: () => Get.to(const PopularTrucksScreen()),
            icon: Text(
              'View all',
              style: h4Style.copyWith(color: AppColor.greyDark),
            ),
          )
        ],
      ),
    );
  }
}
