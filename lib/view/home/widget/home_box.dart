import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class HomeBox extends StatelessWidget {
   HomeBox(
      {super.key,
      this.loading = false,
      required this.image,
      required this.name,
      required this.number});
  final String image;
  final int number;
  final String name;
   bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.width * 0.25 - 20,
            width: MediaQuery.of(context).size.width * 0.25 - 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage(image))),
          ),
         loading ?  CircularProgressIndicator() : Column(
            children: [
              Text(
                number.toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 83, 83, 83)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
