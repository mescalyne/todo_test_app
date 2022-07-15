import 'package:todo_app/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CheckBoxField extends StatelessWidget {
  final bool isComplete;
  final Color color;
  const CheckBoxField({required this.isComplete, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: isComplete ? color : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 3)),
      child: isComplete
          ? Icon(
              CupertinoIcons.checkmark_alt,
              color: AppColors.white,
            )
          : null,
    );
  }
}
