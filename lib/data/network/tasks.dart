import 'package:todo_app/data/client.dart';
import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/resources/logger.dart';
import 'package:todo_app/resources/network_result.dart';
import 'package:todo_app/resources/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class TasksService {
  Future<Result<List<TaskDto>>> getTasks(); //List<TaskDto>?
}

@Injectable(as: TasksService)
class TasksServiceImpl implements TasksService {
  final TodoApi _api;

  TasksServiceImpl(this._api);

  @override
  Future<Result<List<TaskDto>>> getTasks() async {
    try {
      final result = await _api.client.get(
        'public/v2/todos',
      );
      Log.info('TasksServiceImpl - getPosts: ${result.data}');
      print(result.statusCode);
      return Result.success(
          List<TaskDto>.from(result.data.map((e) => TaskDto.fromJson(e))));
    } on DioError catch (_) {
      return Result.failure(Failure(NetworkResult.socketException));
    }
  }
}

