import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class date1 extends StatefulWidget {
  const date1({super.key});

  @override
  State<date1> createState() => _date1State();
}

class _date1State extends State<date1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Select Date',
          style: TextStyle(color: AppColors.pureblack),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            formheader(text: 'Let’s get started', color: AppColors.pureblack),
            formheader(text: 'Select date ?', color: AppColors.pureblack),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: CupertinoCalendar(
                mainColor: AppColors.red,
                minimumDateTime: DateTime(2000, 1, 1),
                maximumDateTime: DateTime(2100, 1, 1),
                initialDateTime: DateTime(2026, 02, 13, 11, 41),
                currentDateTime: DateTime(2025, 02, 13),
                timeLabel: 'Ends',
                headerDecoration: CalendarHeaderDecoration(
                  monthDateArrowColor: AppColors.black,
                  forwardButtonColor: AppColors.pureblack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: PostButton(onPressed: () {}, text: 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
