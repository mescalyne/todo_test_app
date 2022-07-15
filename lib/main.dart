
import 'package:todo_app/data/storage/task_hive_type.dart';
import 'package:todo_app/data/storage/task_storage.dart';
import 'package:todo_app/resources/injection/injection.dart';
import 'package:todo_app/resources/router/bloc/bloc.dart';
import 'package:todo_app/resources/router/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await setupApp();
  runApp(MyApp());
}

Future<void> setupApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveTypeAdapter());
  await TaskStorageHive.init(); // Future.wait([]);

  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Env.dev);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: <LocalizationsDelegate>[
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            fallbackFile: 'ru',
            basePath: 'assets/locales',
          ),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: BlocProvider<RouterBloc>(
          create: (_) => getIt<RouterEventSink>() as RouterBloc,
          child: Router(
            routerDelegate: AppRouterDelegate(),
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      ),
    );
  }
}
