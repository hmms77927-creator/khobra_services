import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class Notifications1 extends StatefulWidget {
  const Notifications1({super.key});

  @override
  State<Notifications1> createState() => _Notifications1State();
}

class _Notifications1State extends State<Notifications1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Booking', style: TextStyle(color: AppColors.pureblack)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          FillForm(text: 'Last 30 Days ', color: AppColors.black),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: NotifiCard1(
              text: 'You Book cleaning service for two Hours ',
              title: 'Tap to View',
            ),
          ),
          NotifiCard1(
            text: 'You Book cleaning service for 1 hour',
            title: 'Tap to View',
          ),
          NotifiCard1(
            text: 'You Cancel your Cleaning Booking ',
            title: 'Cancel your booking ',
          ),
          NotifiCard1(
            text: 'New Updates Available ',
            title: 'Go to play store and update or download the new version',
          ),
          NotifiCard1(
            text: 'Your Booking has been Cancel from Employee ',
            title: 'Tap to View ',
          ),
        ],
      ),
    );
  }
}
