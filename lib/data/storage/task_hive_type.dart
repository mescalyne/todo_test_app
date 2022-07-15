import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_hive_type.g.dart';

@HiveType(typeId: 0)
class TaskHiveType extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? userId;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? dueOn;
  @HiveField(4)
  String? status;

  
  TaskHiveType({
    this.id,
    this.userId,
    this.title,
    this.dueOn,
    this.status,
  });

  
}


