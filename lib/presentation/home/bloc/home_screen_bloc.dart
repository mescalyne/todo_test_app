import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/domain/repository/task_repository.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_event.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_state.dart';
import 'package:todo_app/resources/enum.dart';
import 'package:todo_app/resources/router/bloc/bloc.dart';
import 'package:todo_app/resources/router/bloc/event.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final TaskRepository taskRepository;
  final RouterEventSink routerEventSink;

  HomeScreenBloc({
    required this.taskRepository,
    required this.routerEventSink,
  }) : super(
          HomeScreenState(
            tasks: [],
            screenStatus: ScreenStatus.loading,
          ),
        ) {
    on<ChangeTaskStatusEvent>(_changeTaskStatus);
    on<RouteToCreatePageEvent>((event, emit) {
      routerEventSink.add(RouterEvent.pop());
      routerEventSink.add(RouterEvent.toCreate());
    });

    init();
  }

  Future<void> init() async {
    List<TaskDto> tasks = await taskRepository.getStorageTasks();

    final result = await taskRepository.getApiTasks();
    if (result.isSuccess) {
      tasks += result.value ?? [];
    } else {
      emit(state.copyWith(screenStatus: ScreenStatus.error));
    }

    emit(state.copyWith(
      tasks: tasks,
      screenStatus: ScreenStatus.loaded,
    ));
  }

  Future<void> _changeTaskStatus(
    ChangeTaskStatusEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (event.id == null) return;

    final tasks = state.tasks;
    final index = tasks.indexWhere((element) => element.id == event.id);
    if (index != -1) {
      if (tasks[index].status == 'pending')
        tasks[index].status = 'completed';
      else
        tasks[index].status = 'pending';

      emit(state.copyWith(tasks: tasks));
    }
  }
}
