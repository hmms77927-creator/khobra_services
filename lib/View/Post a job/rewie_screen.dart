import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Booking/booking_1.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class reviewScreen extends StatefulWidget {
  const reviewScreen({super.key});

  @override
  State<reviewScreen> createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {
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
      body: Column(
        children: [
          Reviewcard(
            text: 'Service :  Cleaning ',
            title: 'Duration :  2 Hours ',
            subtitle: 'Date :  23 /  Feb / 2025',
            descrption: 'Rs. 705/-',
            subdescrption: 'Time : ',
            onPressed: () {},
            presubdescrption: '2:00 pm - 3:00 pm',
          ),
          BookedCard(
            text: 'Employer 1',
            title: 'abc',
            subtitle: 'Booked',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            'Booked!',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 36,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                        Container(child: Image.asset(AppImages.dialog)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260.0, left: 20, right: 20),
            child: CustomContainerButton(
              text: 'CONFIRM',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booking1()),
                );
              },
              fontsize: 22,
              fontweight: .w600,
            ),
          ),
        ],
      ),
    );
  }
}
