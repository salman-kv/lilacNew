import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            text: 'Don’t have an account?',
            style: TextStyle(
              color: Colors.black,
            ),
            children: [
          TextSpan(
              text: ' Register', style: TextStyle(color: AppColor.blueColor))
        ]));
  }
}
