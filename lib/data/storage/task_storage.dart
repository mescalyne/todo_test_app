import 'package:todo_app/data/storage/task_hive_type.dart';
import 'package:todo_app/domain/entities/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class TaskStorage {
  Future<void> addNewTask(TaskDto sample);
  Future<List<TaskDto>> getTasks();
  Future<void> cleanAllTasks();
}

@Injectable(as: TaskStorage)
class TaskStorageHive implements TaskStorage {
  static const _samplesBoxName = 'samples';
  Box get _samplesHiveBox => Hive.box<TaskHiveType>(_samplesBoxName);

  static Future init() async {
    await Hive.openBox<TaskHiveType>(_samplesBoxName);
  }

  @override
  Future<void> addNewTask(TaskDto sample) async {
    await _samplesHiveBox.add(sample.toHiveDto());
  }

  @override
  Future<void> cleanAllTasks() async {
    await _samplesHiveBox.clear();
  }

  @override
  Future<List<TaskDto>> getTasks() async {
    final List<TaskDto> tasks = [];
    for (int i = 0; i < _samplesHiveBox.length; i++) {
      final TaskHiveType elem = await _samplesHiveBox.getAt(i) as TaskHiveType;
      final task = elem.toDto();
      tasks.add(task);
    }

    return tasks;
  }
}

extension TaskHiveExtension on TaskHiveType {
  TaskDto toDto() {
    return TaskDto(
      id: id,
      userId: userId,
      dueOn: dueOn,
      title: title,
      status: status,
    );
  }
}

extension TaskDTOExtension on TaskDto {
  TaskHiveType toHiveDto() {
    return TaskHiveType(
      id: id,
      userId: userId,
      dueOn: dueOn,
      title: title,
      status: status,
    );
  }
}

