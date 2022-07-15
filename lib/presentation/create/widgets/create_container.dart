import 'package:todo_app/domain/entities/task.dart';
import 'package:todo_app/presentation/create/bloc/create_screen_bloc.dart';
import 'package:todo_app/presentation/create/bloc/create_screen_event.dart';
import 'package:todo_app/presentation/create/bloc/create_screen_state.dart';
import 'package:todo_app/resources/app_colors.dart';
import 'package:todo_app/resources/enum.dart';
import 'package:todo_app/resources/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreateScreen extends StatefulWidget {
  static const id = "/create";

  CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final titleController = TextEditingController();
  final dueController = TextEditingController();

  var statuses = ["completed", "pending"];
  var statusValue = 'pending';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateScreenBloc, CreateScreenState>(
        builder: (context, state) {
      return BlocConsumer<CreateScreenBloc, CreateScreenState>(
          listener: (context, state) => {
                if (state.screenStatus == ScreenStatus.error)
                  AppSnackBar.showSnackBar('All fields is required', context)
              },
          builder: (context, state) {
            return Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBar(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.text,
                  title: Text('Create task',
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                body: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: 30, left: 30, right: 20, bottom: 6),
                      child: Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.grey),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        controller: titleController,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text.withOpacity(0.7),
                        ),
                        cursorColor: AppColors.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task title..',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text.withOpacity(0.4),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: 20, left: 30, right: 20, bottom: 6),
                      child: Text(
                        'Due on',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.grey),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: dueController,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text.withOpacity(0.7),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pick a date..',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text.withOpacity(0.4),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              dueController.text = formattedDate;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: 20, left: 30, right: 20, bottom: 6),
                      child: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.grey),
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Select status..',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text.withOpacity(0.4),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              //isEmpty: _currentSelectedValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: statusValue,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    print(newValue);
                                    setState(() {
                                      statusValue = newValue ?? statusValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: statuses.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color:
                                              AppColors.text.withOpacity(0.7),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
                bottomNavigationBar: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        state.screenStatus != ScreenStatus.error
                            ? BlocProvider.of<CreateScreenBloc>(context)
                                .add(AddCreateTaskEvent(
                                    task: TaskDto(
                                title: titleController.text,
                                dueOn: dueController.text,
                                status: statusValue,
                              )))
                            : {};
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.persianGreen,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Create a task',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )));
          });
    });
  }
}
