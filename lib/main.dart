import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozanta_test/src/constants/string_constants.dart';
import 'package:mozanta_test/src/utils/app_config.dart';
import 'package:mozanta_test/src/views/screens/splash_screen.dart';

Future<void> main() async {
  await onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
