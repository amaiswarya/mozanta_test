import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozanta_test/src/controllers/hive_controller.dart';

import '../../constants/color_constants.dart';
import '../../constants/string_constants.dart';

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
        body: GetBuilder<HiveController>(
            init: HiveController(),
            builder: (controller) {
              return ListView.builder(
                  itemCount: controller.listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.bgTopColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                                child: Text(
                                    'Name: ${controller.listData[index].name}')),
                            Expanded(
                                child: Text(
                                    'Time: ${controller.listData[index].time}'))
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
