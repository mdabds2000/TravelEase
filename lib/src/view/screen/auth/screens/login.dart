import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/auth/screens/otp.dart';
import 'package:travel_ease/src/view/screen/auth/screens/sign_up.dart';
import 'package:travel_ease/src/view/screen/auth/widgets/auth_btn.dart';
import 'package:travel_ease/src/view/screen/auth/widgets/auth_txtField.dart';
import 'package:travel_ease/src/view/widget/app_button.dart';

import '../../../../../core/app_const.dart';
import '../../../../../core/service_locator.dart';
import '../../../../../services/api_service.dart';
import '../../../../controller/snackbar.dart';
import '../../../../model/Login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService _apiService = locator<ApiService>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
  );

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final loginData = Login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        Map<String, dynamic> response = await _apiService.loginUser(loginData);
        if (response["success"]) {
          if (response["data"]["message"] == "OTP sent to your email") {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('email', _emailController.text.trim());

            showSnackBar('Success', 'OTP Sent Successfully',
                backgroundColor: Colors.green.shade300);

            Get.off(OtpScreen(loginData: loginData));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth > 600 ? 50.w : 90.w,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        3.vSpace,
                        Center(
                          child: SvgPicture.asset(
                            AppAsset.appIcon2,
                            width: constraints.maxWidth > 600 ? 20.w : 40.w,
                          ),
                        ),
                        6.vSpace,
                        Text('Log in', style: h3Style),
                        2.vSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            'Enter your email and password to log in.',
                            style: h4Style.copyWith(color: AppColor.greyDark),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        6.vSpace,
                        Padding(
                          padding: pagePadding,
                          child: Column(
                            children: [
                              AuthField(
                                controller: _emailController,
                                hintText: 'Enter your email',
                                labelText: 'E-mail address*',
                                isEnabled: !_isLoading,
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
                                controller: _passwordController,
                                hintText: 'Password (8+ characters)*',
                                labelText: 'Password*',
                                isPassword: true,
                                isEnabled: !_isLoading,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (!_passwordRegex.hasMatch(value)) {
                                    return 'Password must contain at least 8 characters, including uppercase, lowercase, numbers, and special characters';
                                  }
                                  return null;
                                },
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: h3Style.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              4.vSpace,
                              AppButton(
                                text: 'Login',
                                onPressed: _isLoading ? null : _login,
                                isLoading: _isLoading,
                              ),
                              3.vSpace,
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: h3Style.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: h3Style.copyWith(
                                      color: AppColor.secondaryColor,
                                      fontSize: 15.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => Get.to(const SignUpScreen()),
                                  ),
                                ]),
                              ),
                              20.vSpace,
                              Wrap(
                                spacing: 10,
                                alignment: WrapAlignment.center,
                                children: [
                                  AuthButton(
                                    bgColor: AppColor.greyLight.withOpacity(.2),
                                    icon: AppAsset.googleIcon,
                                    onPressed: () {},
                                  ),
                                  AuthButton(
                                    bgColor:
                                        const Color.fromARGB(255, 23, 121, 219),
                                    icon: AppAsset.fbIcon,
                                    onPressed: () {},
                                  ),
                                  AuthButton(
                                    bgColor: AppColor.black,
                                    icon: AppAsset.appleIcon,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              2.vSpace,
                              Text(
                                'Link an account to log in faster in the future',
                                style: h4Style.copyWith(
                                  color: AppColor.greyDark,
                                  fontSize: 14.sp,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
