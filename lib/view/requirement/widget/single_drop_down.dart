import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class SingleDropDown extends StatelessWidget {
  const SingleDropDown({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(text),
          DropdownButtonFormField(
            decoration: InputDecoration(
                hintStyle:
                    const TextStyle(fontSize: 12, color: AppColor.hintColor),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: InputBorder.none),
            items: [
              DropdownMenuItem(
                  child: Text(
                'option one',
                style: TextStyle(),
              ))
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
