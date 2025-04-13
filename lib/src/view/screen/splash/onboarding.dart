import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/view/screen/auth/screens/choose_auth.dart';
import 'package:truck_ease/src/view/widget/app_button.dart';

import '../auth/screens/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  void nextPage() {
    if (controller.page! < onboardingList.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      Get.off(const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
            child: Stack(
              children: [
                PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {});
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return OnboardWidget(
                      onboarding: onboardingList[index],
                      onNextPressed: nextPage,
                    );
                  },
                ),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: SmoothPageIndicator(
                    controller: controller,
                    effect: ExpandingDotsEffect(
                        dotHeight: 1.h,
                        dotWidth: 2.3.w,
                        activeDotColor: const Color(0xff99BBBD),
                        dotColor: Colors.grey.shade200),
                    count: 3,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardWidget extends StatelessWidget {
  final Onboarding onboarding;
  final VoidCallback onNextPressed;

  const OnboardWidget({
    super.key,
    required this.onboarding,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
              ),
              child: SvgPicture.asset(onboarding.image)),
        ),
        Align(
          alignment: const Alignment(0, 0.3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 100.w,
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      onboarding.title,
                      maxLines: 2,
                      style: h2Style.copyWith(fontSize: 22.sp),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      onboarding.description,
                      maxLines: 2,
                      style: h3Style.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    20.vSpace,
                    AppButton(text: 'Next', onPressed: onNextPressed)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Onboarding {
  String image;
  String title;
  String description;
  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
      image: AppAsset.ob1,
      title: 'Book Your Truck in Just Minutes',
      description:
          'Quickly book a truck with just a few taps. Your delivery is just a click away.'),
  Onboarding(
      image: AppAsset.ob2,
      title: 'Track Your Shipment in Real-Time',
      description:
          'Track your shipment in real-time and stay updated on its location and status.'),
  Onboarding(
      image: AppAsset.ob3,
      title: 'Secure and Reliable Delivery Service',
      description:
          'Enjoy safe and reliable delivery services with our trusted drivers. Your cargo is in good hands.'),
];
