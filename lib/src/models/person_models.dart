import 'package:hive/hive.dart';

part 'person_models.g.dart';

@HiveType(typeId: 1)
class TimerModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String time;

  TimerModel({required this.name, required this.time});
}
