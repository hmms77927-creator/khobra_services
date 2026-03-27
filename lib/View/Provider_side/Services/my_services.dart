import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'All Service',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: .w500,
          ),
        ),
        backgroundColor: AppColors.purple,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ServicesTextfield(
                    text: 'Search here...',
                    controller: searchcontroller,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.tune, color: AppColors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ServicesCard(
                image: AppImages.wiring,
                text: 'Fixing Anroid Smart Devices around',
                title: 'Interior and Wiring',
              ),
            ),
            ServicesCard(
              image: AppImages.wiring_2,
              text: 'Black and White Spot in display',
              title: 'and blur Images',
            ),
            ServicesCard(
              image: AppImages.wiring_3,
              text: 'Retail Shop pest control and',
              title: 'Disinfection of entire premises ',
            ),
            ServicesCard(
              image: AppImages.wiring_4,
              text: 'Uninstallation and Flickering TV',
              title: 'Display Screen',
            ),
          ],
        ),
      ),
    );
  }
}
