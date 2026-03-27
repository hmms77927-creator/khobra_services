import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class AssignPage extends StatefulWidget {
  @override
  State<AssignPage> createState() => _AssignPageState();
}

class _AssignPageState extends State<AssignPage> {
  int selectedIndex = 0; // track selected button

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssignButton(
          image: 'assets/user1.png',
          text: 'John Doe',
          subtitle: 'Plumber',
          isSelected: selectedIndex == 1,
          onPressed: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        SizedBox(height: 10),
        AssignButton(
          image: 'assets/user2.png',
          text: 'Jane Smith',
          subtitle: 'Electrician',
          isSelected: selectedIndex == 2,
          onPressed: () {
            setState(() {
              selectedIndex = 2;
            });
          },
        ),
      ],
    );
  }
}
