import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Booking/booking_1.dart';
import 'package:flutter_application_newproject/View/Clock/select_time.dart';
import 'package:flutter_application_newproject/View/Home/home.dart';
import 'package:flutter_application_newproject/View/Notifications/notifications_1.dart';
import 'package:flutter_application_newproject/View/Profile/profile.dart';

class Bottom1 extends StatefulWidget {
  const Bottom1({super.key});

  @override
  State<Bottom1> createState() => _Bottom1State();
}

class _Bottom1State extends State<Bottom1> {
  int currentindex = 0;
  List pages = [
    Home(),
    Notifications1(),
    FullScreenTimePicker(),
    Booking1(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: AppColors.purple,
        initialActiveIndex: currentindex,
        activeColor: AppColors.white,

        color: AppColors.white,

        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          TabItem(icon: Icon(Icons.home, color: AppColors.white)),
          TabItem(
            icon: Icon(Icons.notifications_outlined, color: AppColors.white),
          ),
          TabItem(icon: Icon(Icons.calendar_month)),
          TabItem(icon: Icon(Icons.calendar_month, color: AppColors.white)),
          TabItem(icon: Icon(Icons.person_outline, color: AppColors.white)),
        ],
      ),
      body: pages.elementAt(currentindex),
    );
  }
}
