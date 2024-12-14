import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lilac/core/common/app_image.dart';
import 'package:lilac/view/requirement/screen/vehicle_requirement_adding_screen.dart';
import 'package:lilac/view/requirement/widget/vehicle_selection_container.dart';

class CreateRequirementPage extends StatelessWidget {
  const CreateRequirementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'What would you prefer to have?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return VehicleRequirementAddingScreen();
                        },
                      ));
                    },
                    child: VehicleSelectionContainer(
                      image: AppImage.car,
                      name: 'Car',
                    )),
                VehicleSelectionContainer(
                  image: AppImage.bike,
                  name: 'Bike',
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
