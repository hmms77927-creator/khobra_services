import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 39.0),
              child: Container(
                width: 320,
                height: 320,
                child: Image.asset(AppImages.home1, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: DashboardCard(
              text: 'Cleaning',
              subtitle: '4.2 ',
              title: 'Cleaning',
              description: 'Minimun Two Hours',
              onPressed: () {},
              onTap: () {},
              doubleTap: () {},
              subdescription: 'Rs 705/-',
            ),
          ),
        ],
      ),
    );
  }
}
