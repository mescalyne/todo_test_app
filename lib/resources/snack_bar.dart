import 'package:flutter/material.dart';

class AppSnackBar {
  static void showSnackBar(String snackBarTitle, BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    var snackBar = SnackBar(
      content: Text(snackBarTitle),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
