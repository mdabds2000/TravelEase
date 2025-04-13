import 'package:flutter/material.dart';

import 'app_data.dart';

class App extends StatelessWidget {
  const App({
    required this.data,
    super.key,
  });

  final AppData data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/built_with_flutter.png',
            height: 70,
          ),
        ),
      ),
    );
  }
}
