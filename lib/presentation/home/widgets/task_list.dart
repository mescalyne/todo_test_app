import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_bloc.dart';
import 'package:todo_app/presentation/home/bloc/home_screen_event.dart';
import 'package:todo_app/presentation/home/widgets/check_box_field.dart';
import 'package:todo_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<TaskDto> tasks;

  const TaskList({required this.tasks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: tasks.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                            .add(ChangeTaskStatusEvent(id: tasks[index].id)),
                        child: CheckBoxField(
                          color: AppColors.persianGreen,
                          isComplete: tasks[index].status == 'completed',
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: Text(
                          tasks[index].title.toString(),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                );
              })
          : Center(
              child: Text(
                'no such tasks',
                style: TextStyle(
                  color: AppColors.text,
                ),
              ),
            ),
    );
  }
}
