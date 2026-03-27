import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';

class Onboarding2 extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const Onboarding2({
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
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                width: 455,
                height: 455,
                child: Image.asset(AppImages.onboarding_2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
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
