import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_ease/core/app_asset.dart';
import '../../../../core/app_style.dart';
import '../../bottom.dart';
import '../auth/screens/login.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnLoginStatus();
  }

  Future<void> _navigateBasedOnLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn) {
      Get.off(CustomBottomBar());
    } else {
      Get.off(const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff003A3E),
            Color(0xff99BBBD),
          ],
          stops: [.7, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAsset.splashIcon,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 30),
          Text(
            'Travel Ease',
            style: h1Style.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      ),
    ));
  }
}
