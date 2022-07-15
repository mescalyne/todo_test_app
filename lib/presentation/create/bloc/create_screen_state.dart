import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/resources/enum.dart';

class CreateScreenState {
  TaskDto? task;
  ScreenStatus screenStatus;

  CreateScreenState({
    this.task,
    required this.screenStatus,
  });

  CreateScreenState copyWith({
    TaskDto? task,
    ScreenStatus? screenStatus,
  }) =>
      CreateScreenState(
        task: task ?? this.task,
        screenStatus: screenStatus ?? this.screenStatus,
      );
}
