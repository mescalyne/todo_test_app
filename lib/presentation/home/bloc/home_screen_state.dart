import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/resources/enum.dart';

class HomeScreenState {
  List<TaskDto> tasks;
  ScreenStatus screenStatus;

  HomeScreenState({
    required this.tasks,
    required this.screenStatus,
  });

  HomeScreenState copyWith({
    List<TaskDto>? tasks,
    ScreenStatus? screenStatus,
  }) =>
      HomeScreenState(
        tasks: tasks ?? this.tasks,
        screenStatus: screenStatus ?? this.screenStatus,
      );
}

