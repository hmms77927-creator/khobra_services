import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/book_list.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/Home_notification/home_notification.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_provi.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_services_detail.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/profile_pro.dart';

class BottomProvider extends StatefulWidget {
  const BottomProvider({super.key});

  @override
  State<BottomProvider> createState() => _BottomProviderState();
}

class _BottomProviderState extends State<BottomProvider> {
  int _currentindex = 0;
  List pages = [
    HomeProvi(),
    BookList(),
    HomeServicesDetail(),
    HomeNotification(),
    ProfilePro(),
  ];

  get white => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
        showSelectedLabels: false,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.black,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentindex == 1
                ? Image.asset(
                    AppImages.bottom_2,
                    color: AppColors.purple,
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    AppImages.bottom_2,
                    color: AppColors.black,
                    width: 24,
                    height: 24,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentindex == 2
                ? Image.asset(
                    AppImages.bottom_3,
                    color: AppColors.purple,
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    AppImages.bottom_3,
                    color: AppColors.black,
                    width: 24,
                    height: 24,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24),
            label: '',
          ),
        ],
      ),
      body: pages.elementAt(_currentindex),
    );
  }
}
