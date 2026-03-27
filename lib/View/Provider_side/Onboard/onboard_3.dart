import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';

class onboard3 extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const onboard3({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Container(
                width: 434,
                height: 400.39,
                child: Image.asset(AppImages.onboarding_3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: .w600,
                    color: AppColors.purple,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: .w600,
                  color: AppColors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
