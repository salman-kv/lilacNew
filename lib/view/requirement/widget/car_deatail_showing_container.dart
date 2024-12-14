import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lilac/core/theme/app_color.dart';

class CarDeatailShowingContainer extends StatelessWidget {
  const CarDeatailShowingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Rolls Roys Ghost Standard (2020',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transmission'),
              Text('Automatic'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transmission'),
              Text('Automatic'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transmission'),
              Text('Automatic'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('Active',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ],
          )
        ],
      ),
    );
  }
}
