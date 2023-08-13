import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../controllers/hive_controller.dart';

class ListWidget extends StatelessWidget {
  final HiveController controller;
  const ListWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
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
                      child: Text('Name: ${controller.listData[index].name}')),
                  Expanded(
                      child: Text('Time: ${controller.listData[index].time}'))
                ],
              ),
            ),
          );
        });
  }
}
