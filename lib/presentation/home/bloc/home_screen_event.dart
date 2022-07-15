abstract class HomeScreenEvent {}

class ChangeTaskStatusEvent extends HomeScreenEvent {
  final int? id;
  ChangeTaskStatusEvent({required this.id});
}

class RouteToCreatePageEvent extends HomeScreenEvent {}
