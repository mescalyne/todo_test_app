import 'package:todo_app/presentation/home/bloc/home_screen_bloc.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_event.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_state.dart';
import 'package:todo_app/presentation/home/widgets/task_list.dart';
import 'package:todo_app/resources/app_colors.dart';
import 'package:todo_app/resources/enum.dart';
import 'package:todo_app/resources/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const id = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) => {
              if (state.screenStatus == ScreenStatus.error)
                AppSnackBar.showSnackBar(
                    'Error internet connection, only storage tasks', context)
            },
        builder: (context, state) {
          final isLoaded = state.screenStatus == ScreenStatus.loaded;

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.white,
                title: Text('Board',
                    style: TextStyle(
                        color: AppColors.text, fontWeight: FontWeight.w600)),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      CupertinoIcons.search,
                      color: AppColors.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: AppColors.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      CupertinoIcons.bars,
                      color: AppColors.text,
                    ),
                  ),
                ],
                bottom: TabBar(
                  labelColor: AppColors.text,
                  indicatorColor: AppColors.black54,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Pending'),
                    Tab(text: 'Complete'),
                  ],
                ),
              ),
              body: isLoaded
                  ? TabBarView(children: [
                      TaskList(
                        tasks: state.tasks,
                      ),
                      TaskList(
                          tasks: state.tasks
                              .where((el) => el.status == 'pending')
                              .toList()),
                      TaskList(
                          tasks: state.tasks
                              .where((el) => el.status == 'completed')
                              .toList()),
                    ])
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.platinum,
                    )),
              bottomNavigationBar: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeScreenBloc>(context)
                        .add(RouteToCreatePageEvent());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.persianGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Add a task',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
