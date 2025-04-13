import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/services/api_service.dart';
import 'package:truck_ease/src/controller/snackbar.dart';
import 'package:truck_ease/src/model/register.dart';
import 'package:truck_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

import '../../../../../core/service_locator.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _travelsNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  final ApiService _apiService = locator<ApiService>();
  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
  );

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    bool isValid = true;

    if (_fullNameController.text.trim().isEmpty) {
      isValid = false;
    } else if (_travelsNameController.text.trim().isEmpty) {
      isValid = false;
    } else if (_emailController.text.trim().isEmpty) {
      isValid = false;
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(_emailController.text.trim())) {
      isValid = false;
    } else if (_phoneNoController.text.trim().isEmpty &&
        _phoneNoController.text.length != 10) {
      isValid = false;
    } else if (_passwordController.text.isEmpty) {
      isValid = false;
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$')
        .hasMatch(_passwordController.text)) {
      isValid = false;
    } else if (_confirmPasswordController.text.isEmpty) {
      isValid = false;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      isValid = false;
    }

    if (isValid) {
      try {
        final registerData = Register(
          ownerName: _fullNameController.text.trim(),
          companyName: _travelsNameController.text.trim(),
          companyEmail: _emailController.text.trim(),
          companyPhone: _phoneNoController.text.trim(),
          companyAddress: "",
          status: "active",
          password: _passwordController.text.trim(),
        );

        final response = await _apiService.registerUser(registerData);

        if (response["success"]) {
          if (response["data"]["status"] == "error") {
            showSnackBar('Error', response["data"]["status"],
                backgroundColor: Colors.red.shade300);
          } else {
            if (response["data"]["status"] == "success") {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', true);
              await prefs.setString(
                  'userName', _fullNameController.text.trim());
              await prefs.setString('userEmail', _emailController.text.trim());
              await prefs.setString(
                  'userPhone', _phoneNoController.text.trim());
              Get.to(const LoginScreen());
            }
          }
        } else {
          showSnackBar('Error', '${response["error"]}',
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
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar('Error', 'Please fill out all fields correctly',
          backgroundColor: Colors.red.shade300);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      3.vSpace,
                      SvgPicture.asset(AppAsset.appIcon2, width: 25.w),
                      6.vSpace,
                      Text('Sign up', style: h3Style),
                      2.vSpace,
                      Text(
                        'Create an account to access your travels on your hands',
                        style: h4Style.copyWith(color: AppColor.greyDark),
                        textAlign: TextAlign.center,
                      ),
                      6.vSpace,
                      AuthField(
                        controller: _fullNameController,
                        hintText: 'Enter your full name',
                        labelText: 'Full Name*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      3.vSpace,
                      AuthField(
                        controller: _travelsNameController,
                        hintText: 'Enter your travels name',
                        labelText: 'Travels Name*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your travels name';
                          }
                          return null;
                        },
                      ),
                      3.vSpace,
                      AuthField(
                        controller: _emailController,
                        hintText: 'Enter your email address',
                        labelText: 'Email*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!_emailRegex.hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      3.vSpace,
                      AuthField(
                        controller: _phoneNoController,
                        hintText: 'Enter your mobile number',
                        labelText: 'Mobile No.*',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          } else if (value.length != 10) {
                            return 'Enter a valid 10-digit mobile number';
                          }
                          return null;
                        },
                      ),
                      3.vSpace,
                      AuthField(
                        controller: _passwordController,
                        hintText: 'Password (8+ characters)*',
                        labelText: 'Password*',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (!_passwordRegex.hasMatch(value)) {
                            return 'Password must contain at least 8 characters, including uppercase, lowercase, numbers, and special characters';
                          }
                          return null;
                        },
                      ),
                      3.vSpace,
                      AuthField(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm Password*',
                        labelText: 'Confirm Password*',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      6.vSpace,
                      AppButton(
                        text: 'Create an account',
                        onPressed: _isLoading ? null : _signUp,
                        isLoading: _isLoading,
                      ),
                      3.vSpace,
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: h3Style.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: h3Style.copyWith(
                              color: AppColor.secondaryColor,
                              fontSize: 15.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed('/login'),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
