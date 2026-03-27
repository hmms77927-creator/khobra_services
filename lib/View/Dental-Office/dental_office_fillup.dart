import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class DentalOfficeFillup extends StatefulWidget {
  const DentalOfficeFillup({super.key});

  @override
  State<DentalOfficeFillup> createState() => _DentalOfficeFillupState();
}

class _DentalOfficeFillupState extends State<DentalOfficeFillup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 20,
            fontWeight: .w700,
          ),
        ),
        backgroundColor: AppColors.white,
        leading: LeadButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: .topLeft,
            child: Container(
              width: 245,
              child: Divider(color: AppColors.darkskin, thickness: 6),
            ),
          ),
          Container(
            width: 393,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColors.pureblack.withOpacity(0.2),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Divider(color: AppColors.white, thickness: 6),
          ),
          formheader(
            text: 'Enter your information for you\n profile',
            color: AppColors.lightBlack,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: FillForm(
              text: 'Upload Image (optional)',
              color: AppColors.pureblack,
            ),
          ),
          Card(
            elevation: 4,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 266,
                height: 178,
                child: Image.asset(AppImages.upload_image, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0, left: 195),
            child: ArrowButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              'We Say Hello!',
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
          ),
        ],
      ),
    );
  }
}
