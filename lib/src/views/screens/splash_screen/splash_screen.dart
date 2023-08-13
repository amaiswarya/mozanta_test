import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/color_constants.dart';
import '../home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const Home());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("assets/images/stopwatch.jpg"),
                  height: 200,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "STOPWATCH",
                  style: TextStyle(
                      color: AppColors.bgTopColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SpinKitPouringHourGlassRefined(
                  color: AppColors.bgTopColor,
                  size: 60,
                ),
              ])),
    ));
  }
}
