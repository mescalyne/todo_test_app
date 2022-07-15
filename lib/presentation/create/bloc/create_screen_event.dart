
import 'package:todo_app/domain/entities/task.dart';

abstract class CreateScreenEvent {}

class AddCreateTaskEvent extends CreateScreenEvent {
  final TaskDto task;

  AddCreateTaskEvent({required this.task});
}
