import 'dart:async';

import 'package:get/get.dart';

import '../constants/enum.dart';

class StopWatchController extends GetxController {
  final Stopwatch stopwatch = Stopwatch();
  ButtonState currentState = ButtonState.start;
  late Timer timer;
  RxString result = '00:00:00'.obs;

  void start() {
    timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      result.value =
          '${stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      currentState = ButtonState.stop;
      update();
    });

    stopwatch.start();
    update();
  }

  void stop() {
    timer.cancel();
    stopwatch.stop();

    currentState = ButtonState.save;
    update();
  }
}
