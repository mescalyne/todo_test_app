import 'package:todo_app/resources/router/bloc/event.dart';
import 'package:todo_app/resources/screen_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

typedef RouteEventHandler = Stream<List<RouteInfo>>;

abstract class RouterEventSink {
  void add(RouterEvent event);
}

@Singleton(as: RouterEventSink)
class RouterBloc extends Bloc<RouterEvent, List<RouteInfo>>
    implements RouterEventSink {
  RouterBloc() : super([ScreenProvider.home()]) {
    on<OnPop>((event, emit) {
      emit([...state..removeLast()]);
    });
    on<ToHome>((event, emit) {
      emit([...state, ScreenProvider.home()]);
    });
    on<ToCreate>((event, emit) {
      emit([...state, ScreenProvider.create()]);
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
