import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class HomeRewive extends StatefulWidget {
  const HomeRewive({super.key});

  @override
  State<HomeRewive> createState() => _HomeRewiveState();
}

class _HomeRewiveState extends State<HomeRewive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Review On Services',
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: head2cont(
                text: 'Customer Review By Service Name',
                color: AppColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: customerReviewcard(
                image: AppImages.review_1,
                text: 'Donna Bins',
                subtext: '@DONNABINS',
                title: 'Service Name : Painting',
                subtitle:
                    'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: customerReviewcard(
                image: AppImages.review_2,
                text: 'Donna Bins',
                subtext: '@DONNABINS',
                title: 'Service Name : Painting',
                subtitle:
                    'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: customerReviewcard(
                image: AppImages.review_3,
                text: 'Donna Bins',
                subtext: '@DONNABINS',
                title: 'Service Name : Painting',
                subtitle:
                    'Amet minim mollit non deserunt\nullamco est sit aliqua dolor do amet. ',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
