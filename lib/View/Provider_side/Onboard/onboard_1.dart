import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';

class Onboard1 extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const Onboard1({
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
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 50),
              child: Container(
                width: 412,
                height: 355,
                child: Image.asset(AppImages.onboarding_1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
                title,
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
