import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
      {super.key,
      required this.labelIcon,
      required this.hint,
      required this.textEditingController});
  final Icon labelIcon;
  final String hint;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: AppColor.hintColor),
            prefixIcon: labelIcon,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            border: InputBorder.none),
      ),
    );
  }
}
