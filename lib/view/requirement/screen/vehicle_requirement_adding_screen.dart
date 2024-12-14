import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lilac/view/requirement/widget/single_drop_down.dart';

class VehicleRequirementAddingScreen extends StatelessWidget {
  const VehicleRequirementAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Vehicle requirment',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: ListView(
        children: [
          SingleDropDown(
            text: 'Brand',
          ),
        ],
      ),
    ));
  }
}
