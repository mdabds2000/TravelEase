import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/src/controller/user_controller.dart';
import 'package:truck_ease/src/view/bottom.dart';
import 'package:truck_ease/src/view/screen/auth/screens/app_loader.dart';
import 'package:truck_ease/src/view/screen/splash/splash.dart';

import 'core/service_locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    kIsWeb
        ? DevicePreview(
            enabled: true,
            builder: (context) => const MyApp(),
          )
        : const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ResponsiveSizer(
          builder: (context, screenType, orientation) => GetMaterialApp(
            initialBinding: BindingsBuilder(() {
              Get.put(UserController());
            }),
            title: 'Truck Ease',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          ),
        ));
  }
}
