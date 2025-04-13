import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/model/otp_verification.dart';
import 'package:travel_ease/src/view/bottom.dart';
import 'package:travel_ease/src/view/screen/auth/widgets/otp_txtField.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

import '../../../../../core/service_locator.dart';
import '../../../../../services/api_service.dart';
import '../../../../controller/snackbar.dart';
import '../../../../model/Login.dart';

class OtpScreen extends StatefulWidget {
  final Login loginData;
  const OtpScreen({super.key, required this.loginData});

  @override
  State<OtpScreen> createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {
  final ApiService _apiService = locator<ApiService>();
  bool _isLoading = false;
  final int _otpExpiryDuration = 5 * 60; // 5 minutes in seconds
  int _remainingTime = 0;
  Timer? _timer;
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  void _startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? otpSentTime = prefs.getInt('otpSentTime');

    if (otpSentTime != null) {
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      int elapsedTime = (currentTime - otpSentTime) ~/ 1000;

      if (elapsedTime < _otpExpiryDuration) {
        _remainingTime = _otpExpiryDuration - elapsedTime;
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (_remainingTime > 0) {
              _remainingTime--;
            } else {
              timer.cancel();
            }
          });
        });
      } else {
        _remainingTime = 0;
      }
    } else {
      _remainingTime = _otpExpiryDuration;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            timer.cancel();
          }
        });
      });
    }
  }

  Future<void> resendOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Map<String, dynamic> response =
          await _apiService.loginUser(widget.loginData);
      if (response["success"]) {
        if (response["data"]["message"] == "OTP sent to your email") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt(
              'otpSentTime', DateTime.now().millisecondsSinceEpoch);

          _remainingTime = _otpExpiryDuration;
          _startTimer();

          showSnackBar('Success', 'OTP resent',
              backgroundColor: Colors.green.shade300);
        } else {
          showSnackBar('Error', 'OTP not sent',
              backgroundColor: Colors.red.shade300);
        }
      } else {
        showSnackBar('Error', 'Invalid Credentials',
            backgroundColor: Colors.red.shade300);
      }
    } catch (e) {
      showSnackBar('Error', 'Something went wrong',
          backgroundColor: Colors.red.shade300);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    final enteredOtp = otpController.text.trim();

    if (enteredOtp.isEmpty) {
      showSnackBar('Error', 'Please enter the valid OTP',
          backgroundColor: Colors.red.shade300);
    } else {
      if (_remainingTime <= 0) {
        showSnackBar('Error', 'OTP has expired. Please request a new OTP.',
            backgroundColor: Colors.red.shade300);
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final loginData = OtpVerification(
        otp: enteredOtp,
      );

      Map<String, dynamic> response = await _apiService.verifyOTP(loginData);

      if (response["success"]) {
        if (response["data"]["status"] == "error") {
          showSnackBar('Error', response["data"]["status"],
              backgroundColor: Colors.red.shade300);
        } else {
          if (response["data"]["message"] == "Login successful") {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);
            await prefs.setString('userName', response["data"]["data"]["name"]);
            Get.off(CustomBottomBar());
          } else {
            showSnackBar('Error', response["data"]["message"],
                backgroundColor: Colors.red.shade300);
          }
        }
      } else {
        showSnackBar('Error', 'Please enter valid OTP',
            backgroundColor: Colors.red.shade300);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(AppAsset.backIcon),
              ),
            ),
            6.vSpace,
            Text(
              'Please verify your email address',
              style: h3Style.copyWith(letterSpacing: 1.2),
            ),
            2.vSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Email sent to ${widget.loginData.email}, please enter the code below.',
                style: h4Style.copyWith(color: AppColor.greyDark),
                textAlign: TextAlign.center,
              ),
            ),
            4.vSpace,
            Padding(
              padding: pagePadding,
              child: Column(
                children: [
                  OtpTextField(controller: otpController),
                  3.vSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Did\'t get the OTP? ',
                          style: h3Style.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text: _remainingTime > 0
                              ? 'Resend OTP in ${_formatTime(_remainingTime)}'
                              : 'Resend OTP',
                          style: h3Style.copyWith(
                            color: _isLoading || _remainingTime > 0
                                ? AppColor.greyBorder
                                : AppColor.secondaryColor,
                            fontSize: 15.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (!_isLoading && _remainingTime <= 0) {
                                resendOTP();
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                  5.vSpace,
                  AppButton(
                      text: 'Continue',
                      onPressed: _isLoading ? null : verifyOtp,
                      isLoading: _isLoading),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
