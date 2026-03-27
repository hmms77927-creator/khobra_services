import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';

class HandymanList extends StatefulWidget {
  const HandymanList({super.key});

  @override
  State<HandymanList> createState() => _HandymanListState();
}

class _HandymanListState extends State<HandymanList> {
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
            'Driver List',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: AppColors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5,
                bottom: 5,
                top: 10,
              ),
              child: handymancard(
                text: 'Fatime         ',
                subtext: 'fatima@gmail.com',
                title: '1901 Township\n Lahore ',
                subtitle: '03209876523',
                color: AppColors.fullgrey,
                textcolor: AppColors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHandyman()),
                  );
                },
                image: AppImages.booking,
                buttontext: 'Deactivate',
                subbuttontext: 'Activate',
                onTap: () {},
                onDoubleTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: handymancard(
                text: 'John Missder',
                subtext: 'john@gmail.com',
                title: '876 10th Street\n GreenCap Lahore  ',
                subtitle: '0320987655',
                color: AppColors.fullgrey,
                textcolor: AppColors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHandyman()),
                  );
                },
                image: AppImages.handyman_2,
                buttontext: 'Deactivate',
                subbuttontext: 'Activate',
                onTap: () {},
                onDoubleTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: handymancard(
                text: 'Sidra Khan ',
                subtext: 'sidra@gmail.com',
                title: 'Behria Town Lahore',
                subtitle: '0324738393',
                color: AppColors.fullgrey,
                textcolor: AppColors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHandyman()),
                  );
                },
                image: AppImages.handyman_3,
                buttontext: 'Deactivate',
                subbuttontext: 'Activate',
                onTap: () {},
                onDoubleTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
