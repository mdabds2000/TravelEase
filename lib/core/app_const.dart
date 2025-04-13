import 'package:flutter/widgets.dart';
import 'package:travel_ease/src/model/popularTrucks_model.dart';

const String baseURL =
    "https://9879-2401-4900-1ce1-450e-e854-7d27-2405-f6e9.ngrok-free.app/api";

const String baseURLRegister = "$baseURL/company.php";
const String baseURLLogin = "$baseURL/login.php";
const String baseURLOTPVerify = "$baseURL/otpverification.php";
const String baseURLVehicle = "$baseURL/vehicle.php";
const String baseURLDriver = "$baseURL/driver.php";
const String baseURLCompany = "$baseURL/company.php";

EdgeInsets pagePadding = const EdgeInsets.symmetric(horizontal: 20);
EdgeInsets leftPadding = const EdgeInsets.only(left: 20);
EdgeInsets rightPadding = const EdgeInsets.only(right: 20);

List<PopularTruckModel> popularTruck = [
  PopularTruckModel(
      truckName: '18 Wheeler truck',
      truckImg:
          'https://wallpapers.com/images/hd/black-volvo-cool-truck-cdvn4ttk7o8geggz.jpg',
      hearted: false,
      pickUpTime: '10:00 AM - 12:30 PM',
      dropTime: '03:00 PM - 05:30 PM',
      id: 0),
  PopularTruckModel(
      truckName: '18 Wheeler truck',
      truckImg:
          'https://wallpapers.com/images/hd/black-volvo-cool-truck-cdvn4ttk7o8geggz.jpg',
      hearted: false,
      pickUpTime: '10:00 AM - 12:30 PM',
      dropTime: '03:00 PM - 05:30 PM',
      id: 1),
  PopularTruckModel(
      truckName: '18 Wheeler truck',
      truckImg:
          'https://wallpapers.com/images/hd/black-volvo-cool-truck-cdvn4ttk7o8geggz.jpg',
      hearted: false,
      pickUpTime: '10:00 AM - 12:30 PM',
      dropTime: '03:00 PM - 05:30 PM',
      id: 2),
  PopularTruckModel(
      truckName: '18 Wheeler truck',
      truckImg:
          'https://wallpapers.com/images/hd/black-volvo-cool-truck-cdvn4ttk7o8geggz.jpg',
      hearted: false,
      pickUpTime: '10:00 AM - 12:30 PM',
      dropTime: '03:00 PM - 05:30 PM',
      id: 3),
];
