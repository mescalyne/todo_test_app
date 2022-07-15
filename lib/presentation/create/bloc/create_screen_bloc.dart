import 'package:todo_app/domain/repository/task_repository.dart';
import 'package:todo_app/presentation/create/bloc/create_screen_event.dart';
import 'package:todo_app/presentation/create/bloc/create_screen_state.dart';
import 'package:todo_app/resources/enum.dart';
import 'package:todo_app/resources/router/bloc/bloc.dart';
import 'package:todo_app/resources/router/bloc/event.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateScreenBloc extends Bloc<CreateScreenEvent, CreateScreenState> {
  final TaskRepository taskRepository;
  final RouterEventSink routerEventSink;

  CreateScreenBloc({
    required this.taskRepository,
    required this.routerEventSink,
  }) : super(CreateScreenState(screenStatus: ScreenStatus.loaded)) {
    on<AddCreateTaskEvent>((event, emit) async {
      print(event.task.title);
      print(event.task.dueOn);
      print(event.task.status);

      if (event.task.title == null ||
          event.task.title!.isEmpty ||
          event.task.dueOn == null ||
          event.task.dueOn!.isEmpty) {
        emit(state.copyWith(screenStatus: ScreenStatus.error));
        await Future.delayed(Duration(seconds: 2));
      } else {
        await taskRepository.addNewTask(event.task);
        routerEventSink.add(RouterEvent.pop());
        routerEventSink.add(RouterEvent.toHome());
      }
      emit(state.copyWith(screenStatus: ScreenStatus.loaded));
    });
  }
}
