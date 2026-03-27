import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Pages = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              child: Align(
                alignment: .topLeft,
                child: Text(
                  'Hi, IQRA',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: .topLeft,
              child: Container(
                child: Text(
                  'What Would you like to search below?',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 13,
                    fontWeight: .w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.white,
        actions: [Icon(Icons.notifications_outlined, color: AppColors.purple)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: HomeField(hintText: 'Search for..', onPressed: () {}),
            ),
            ListView.builder(
              itemCount: Pages.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: HomeCard(
                    image: AppImages.home1,
                    text: 'Cleaning ',
                    subtext: 'Two Hours',
                    title: 'Rs. 705/-',
                    subtitle: '4.2',
                    description: 'duration',
                    subdescription: '2:00 pm - 3:00 pm',
                    onPressed: () {},
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
