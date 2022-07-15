import 'package:todo_app/presentation/create/bloc/create_screen_bloc.dart';
import 'package:todo_app/presentation/create/widgets/create_container.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_bloc.dart';
import 'package:todo_app/presentation/home/home_screen.dart';
import 'package:todo_app/resources/injection/injection.dart';
import 'package:todo_app/resources/router/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenProvider {
  static RouteInfo home() => RouteInfo(
        id: HomeScreen.id,
        builder: (_) => BlocProvider<HomeScreenBloc>(
          create: (_) => getIt<HomeScreenBloc>(),
          child: HomeScreen(),
        ),
      );
  static RouteInfo create() => RouteInfo(
        id: CreateScreen.id,
        builder: (_) => BlocProvider<CreateScreenBloc>(
          create: (_) => getIt<CreateScreenBloc>(),
          child: CreateScreen(),
        ),
      );
}

class RouteInfo {
  final String id;
  final WidgetBuilder builder;
  PageType type;

  RouteInfo({
    required this.id,
    this.type = PageType.screen,
    required this.builder,
  });

  @override
  String toString() {
    return 'Route: {id: $id, builder: $builder}';
  }
}
