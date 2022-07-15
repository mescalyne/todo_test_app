// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/client.dart' as _i5;
import '../../data/network/tasks.dart' as _i6;
import '../../data/storage/task_storage.dart' as _i4;
import '../../domain/repository/task_repository.dart' as _i7;
import '../../presentation/create/bloc/create_screen_bloc.dart' as _i8;
import '../../presentation/home/bloc/home_screen_bloc.dart' as _i9;
import '../router/bloc/bloc.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.RouterEventSink>(_i3.RouterBloc());
  gh.factory<_i4.TaskStorage>(() => _i4.TaskStorageHive());
  gh.lazySingleton<_i5.TodoApi>(() => _i5.TodoApiImpl());
  gh.factory<_i6.TasksService>(() => _i6.TasksServiceImpl(get<_i5.TodoApi>()));
  gh.factory<_i7.TaskRepository>(() =>
      _i7.TaskRepositoryImpl(get<_i4.TaskStorage>(), get<_i6.TasksService>()));
  gh.factory<_i8.CreateScreenBloc>(() => _i8.CreateScreenBloc(
      taskRepository: get<_i7.TaskRepository>(),
      routerEventSink: get<_i3.RouterEventSink>()));
  gh.factory<_i9.HomeScreenBloc>(() => _i9.HomeScreenBloc(
      taskRepository: get<_i7.TaskRepository>(),
      routerEventSink: get<_i3.RouterEventSink>()));
  return get;
}
