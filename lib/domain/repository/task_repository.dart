import 'package:todo_app/data/network/tasks.dart';
import 'package:todo_app/data/storage/task_storage.dart';
import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/resources/result.dart';
import 'package:injectable/injectable.dart';

abstract class TaskRepository {
  Future<List<TaskDto>> addNewTask(TaskDto sample);
  Future<List<TaskDto>> getStorageTasks();
  Future<Result<List<TaskDto>>> getApiTasks();
  Future<void> cleanAllTasks();
}

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskStorage _taskStorage;
  final TasksService _taskService;
  TaskRepositoryImpl(
    this._taskStorage,
    this._taskService,
  );

  @override
  Future<List<TaskDto>> addNewTask(TaskDto sample) async {
    await _taskStorage.addNewTask(sample);
    final list = await _taskStorage.getTasks();

    return list;
  }

  @override
  Future<List<TaskDto>> getStorageTasks() async {
    final list = await _taskStorage.getTasks();

    return list;
  }

  @override
  Future<Result<List<TaskDto>>> getApiTasks() async {
    final list = await _taskService.getTasks();

    return list;
  }

  @override
  Future<void> cleanAllTasks() async {
    await _taskStorage.cleanAllTasks();
  }
}
