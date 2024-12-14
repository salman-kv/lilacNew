import 'package:flutter/material.dart';

class AppSnackbar {
  static showSnack(
      {required BuildContext context,
      required bool error,
      required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: error ? Colors.red : Colors.green,
        content: Text(text)));
  }
}
