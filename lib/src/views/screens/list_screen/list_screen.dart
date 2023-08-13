import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozanta_test/src/controllers/hive_controller.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/string_constants.dart';
import 'list_widget.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            StringConstants.timerList,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          backgroundColor: AppColors.bgTopColor,
        ),
        body: bodyWidget(),
      ),
    );
  }

  GetBuilder<HiveController> bodyWidget() {
    return GetBuilder<HiveController>(
        init: HiveController(),
        builder: (controller) {
          return ListWidget(
            controller: controller,
          );
        });
  }
}
