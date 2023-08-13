import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/person_models.dart';

class HiveController extends GetxController {
  List<TimerModel> listData = <TimerModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getListFromHive();
  }

  getListFromHive() async {
    final box = await Hive.openBox<TimerModel>('records');
    listData = box.values.toList();
    update();
  }

  addToHiveList(TimerModel item) async {
    var box = await Hive.openBox<TimerModel>('records');
    box.add(item);
    getListFromHive();
  }
}
