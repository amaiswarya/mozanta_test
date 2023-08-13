import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozanta_test/src/controllers/hive_controller.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/enum.dart';
import '../../../constants/string_constants.dart';
import '../../../controllers/stop_watch_controller.dart';
import '../../../models/person_models.dart';
import '../../widgets/button_widget.dart';
import '../home_screen/home.dart';
import '../list_screen/list_screen.dart';

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hController = Get.put(HiveController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.stopwatchbgcolor,
        body: bodyWidget(hController),
      ),
    );
  }

  Center bodyWidget(HiveController hController) {
    return Center(
      child: GetBuilder<StopWatchController>(
          init: StopWatchController(),
          builder: (controller) {
            return Column(
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
                        controller.result.value,
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
                    buttonName: controller.currentState == ButtonState.start
                        ? StringConstants.start
                        : controller.currentState == ButtonState.stop
                            ? StringConstants.stop
                            : StringConstants.save,
                    onpressed: () {
                      onPress(controller.currentState, controller, hController);
                    }),
              ],
            );
          }),
    );
  }

  onPress(ButtonState state, StopWatchController controller,
      HiveController hController) {
    switch (state) {
      case ButtonState.start:
        controller.start();
        break;
      case ButtonState.stop:
        controller.stop();
        break;
      case ButtonState.save:
        hController.addToHiveList(TimerModel(
            name: nameController.text, time: controller.result.value));
        Get.off(const PersonList());
        nameController.clear();
        break;
    }
  }
}
