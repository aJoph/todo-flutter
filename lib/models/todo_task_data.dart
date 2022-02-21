import 'package:hive_flutter/hive_flutter.dart';

part 'todo_task_data.g.dart';

@HiveType(typeId: 0, adapterName: 'TodoTaskAdapter')
class TodoTaskData {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? dateString;
  @HiveField(3)
  double? rank;
  @HiveField(4)
  bool? done;

  TodoTaskData(
      {required this.title,
      required this.description,
      this.dateString,
      this.rank});
}
