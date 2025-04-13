import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_ease/src/view/screen/auth/screens/wise_splash_screen.dart';

import '../../../../controller/user_controller.dart';
import '../../splash/onboarding.dart';
import 'app_data.dart';
import 'login.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  final _isSplashScreenVisible = ValueNotifier(true);

  final _data = ValueNotifier<AppData?>(null);

  late final _controller = WiseSplashScreen.createController(this);

  Future<void>? _loader;

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener(
      (AnimationStatus status) {
        _isSplashScreenVisible.value = !status.isCompleted;
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loader ??= _load(context);
  }

  @override
  void dispose() {
    _isSplashScreenVisible.dispose();
    _data.dispose();
    _controller.dispose();

    super.dispose();
  }

  Future<void> _load(BuildContext context) async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));

    _data.value = const AppData();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward().ignore();
    });
  }

  Future<Widget> _getHomeScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      return const OnboardingScreen();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ValueListenableBuilder(
              valueListenable: _data,
              builder: (context, data, _) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ResponsiveSizer(
                    builder: (context, screenType, orientation) =>
                        FutureBuilder<Widget>(
                      future: _getHomeScreen(),
                      // Use FutureBuilder to get the home screen
                      builder: (context, snapshot) {
                        return GetMaterialApp(
                          initialBinding: BindingsBuilder(() {
                            Get.put(UserController());
                          }),
                          title: 'Truck Ease',
                          debugShowCheckedModeBanner: false,
                          theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          ),
                          home: snapshot
                              .data, // Set the home screen based on SharedPreferences
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _isSplashScreenVisible,
              builder: (context, isSplashScreenVisible, splashScreen) {
                if (isSplashScreenVisible) {
                  return splashScreen!;
                }

                return const SizedBox.shrink();
              },
              child: WiseSplashScreen(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
