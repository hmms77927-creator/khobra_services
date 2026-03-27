import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class HandyAbout extends StatefulWidget {
  const HandyAbout({super.key});

  @override
  State<HandyAbout> createState() => _HandyAboutState();
}

class _HandyAboutState extends State<HandyAbout> {
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
            'Change Password',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 157,
                  height: 132,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.fieldcolor,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25),
                          child: Image.asset(AppImages.about_1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: headingcon(
                            text: 'Terms and\n conditions',
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 157,
                  height: 132,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.fieldcolor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25),
                          child: Image.asset(AppImages.about_2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: headingcon(
                            text: 'Privacy\n Policy',
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 157,
                  height: 132,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.fieldcolor,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25),
                          child: Image.asset(AppImages.about_1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: headingcon(
                            text: 'Help and\n support',
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 157,
                  height: 132,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.fieldcolor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25),
                          child: Image.asset(AppImages.about_1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: headingcon(
                            text: 'Help and\n support',
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
