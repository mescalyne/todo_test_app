import 'package:todo_app/resources/router/bloc/bloc.dart';
import 'package:todo_app/resources/router/bloc/event.dart';
import 'package:todo_app/resources/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, Iterable<RouteInfo>>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, stack) {
        try {
          if (stack.isEmpty) {
            return Container();
          } else {
            final path = StringBuffer();
            final pages = <RegularPage>[];
            for (final page in stack) {
              path.write(page.id);
              pages.add(
                RegularPage<dynamic>(
                  id: page.id,
                  type: page.type,
                  key: ValueKey<dynamic>(path),
                  child: WillPopScope(
                    onWillPop: () async {
                      return !Navigator.of(context).userGestureInProgress;
                    },
                    child: page.builder(context),
                  ),
                ),
              );
            }

            return Navigator(
              key: navigatorKey,
              pages: pages,
              reportsRouteUpdateToEngine: true,
              onPopPage: (route, dynamic result) {
                if (!route.didPop(result)) return false;

                if (route.settings.name != null) {
                  context.read<RouterBloc>().add(const RouterEvent.pop());
                }

                return true;
              },
            );
          }
        } catch (ex) {
          print(ex.toString());
          return Container();
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}
}

class RegularPage<T> extends Page<T> {
  /// The content to be shown in the [Route] created by this page.
  final Widget child;
  final PageType type;
  final ValueKey key;
  final String id;

  const RegularPage({
    required this.child,
    required this.type,
    required this.id,
    required this.key,
  }) : super(key: key, name: id);

  @override
  Route<T> createRoute(BuildContext context) {
    switch (type) {
      case PageType.screen:
        return MaterialPageRoute<T>(
          settings: this,
          builder: (_) => child,
        );
      case PageType.dialog:
        return DialogRoute<T>(
          context: context,
          settings: this,
          builder: (_) => child,
        );
    }
  }
}

enum PageType {
  screen,
  dialog,
}
