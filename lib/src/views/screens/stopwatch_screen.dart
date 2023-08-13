import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mozanta_test/src/controllers/hive_controller.dart';

import '../../constants/color_constants.dart';
import '../../constants/enum.dart';
import '../../constants/string_constants.dart';
import '../../models/person_models.dart';
import '../widgets/button_widget.dart';
import 'home.dart';
import 'list_screen.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  // Initialize an instance of Stopwatch
  final Stopwatch _stopwatch = Stopwatch();
  ButtonState currentState = ButtonState.start;
  // Timer
  late Timer _timer;
  final controller = Get.put(HiveController());
// Time displayed
  String _result = '00:00:00';
// Function to start the stop watch
  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      setState(() {
        _result =
            '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
        currentState = ButtonState.stop;
      });
    });

    _stopwatch.start();
  }

  // Function to stop the stopwatch
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
    setState(() {
      currentState = ButtonState.save;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.stopwatchbgcolor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.watchprimaryColor,
                      AppColors.watchsecondaryColor
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.timer,
                      size: 90,
                      color: Colors.white,
                    ),
                    Text(
                      _result,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 90.0,
              ),
              ButtonWidget(
                  buttonName: currentState == ButtonState.start
                      ? StringConstants.start
                      : currentState == ButtonState.stop
                          ? StringConstants.stop
                          : StringConstants.save,
                  onpressed: () {
                    getButtonName(currentState);

                    if (currentState == ButtonState.save) {
                      controller.addToHiveList(
                          TimerModel(name: nameController.text, time: _result));
                      Get.off(const PersonList());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  getButtonName(ButtonState state) {
    switch (state) {
      case ButtonState.start:
        _start();
        break;
      case ButtonState.stop:
        _stop();
        break;
      case ButtonState.save:
        break;
    }
  }
}
