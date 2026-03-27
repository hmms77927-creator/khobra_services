import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class BookNotification extends StatefulWidget {
  const BookNotification({super.key});

  @override
  State<BookNotification> createState() => _BookNotificationState();
}

class _BookNotificationState extends State<BookNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Notification',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: subcontainer(text: 'New', color: AppColors.black),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: subcontainer(
                    text: 'Mark as all read',
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 30),
              child: booknotifi(
                text: 'Task Completed',
                title: '02 min ago',
                subtitle: 'You completed the\n task',
                color: AppColors.black,
                subcolor: AppColors.fullgrey,
                textcolor: AppColors.fullgrey,
                containcolor: AppColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 30),
              child: booknotifi(
                text: 'Task Completed',
                title: '25 min ago',
                subtitle: 'You completed the\n task',
                color: AppColors.black,
                subcolor: AppColors.fullgrey,
                textcolor: AppColors.fullgrey,
                containcolor: AppColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 30),
              child: booknotifi(
                text: 'Task Completed',
                title: '30 min ago',
                subtitle: 'You completed the\n task',
                color: AppColors.black,
                subcolor: AppColors.fullgrey,
                textcolor: AppColors.fullgrey,
                containcolor: AppColors.fieldcolor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, right: 30),
              child: booknotifi(
                text: 'Task Completed',
                title: '25 min ago',
                subtitle: 'You completed the\n task',
                color: AppColors.black,
                subcolor: AppColors.fullgrey,
                textcolor: AppColors.fullgrey,
                containcolor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
