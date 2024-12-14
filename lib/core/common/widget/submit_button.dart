import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton(
      {super.key, this.height = 50, required this.text, required this.onClick});
  double height;
  final String text;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
          minimumSize: Size(double.infinity, height),
          backgroundColor: AppColor.brownColor),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColor.whiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
