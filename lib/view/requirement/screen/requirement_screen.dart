import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lilac/core/common/widget/submit_button.dart';
import 'package:lilac/view/requirement/screen/create_requirement_page.dart';
import 'package:lilac/view/requirement/widget/car_deatail_showing_container.dart';

class RequirementScreen extends StatelessWidget {
  const RequirementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Requirement  List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              CarDeatailShowingContainer()
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubmitButton(
              text: '+ Create A Requirement',
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return CreateRequirementPage();
              },
            ));
              },
            ),
          )
        ],
      ),
    ));
  }
}
