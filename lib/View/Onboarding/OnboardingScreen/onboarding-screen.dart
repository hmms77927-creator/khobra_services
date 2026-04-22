import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Login-Screen/login-screen.dart';
import 'package:flutter_application_newproject/View/Onboarding/onboarding-1.dart';
import 'package:flutter_application_newproject/View/Onboarding/onboarding-2.dart';
import 'package:flutter_application_newproject/View/Onboarding/onboarding-3.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController = PageController();
  int currentpages = 0;
  final int totalpages = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentpages = index;
                });
              },
              children: [
                Onboarding1(
                  image: AppImages.onboarding_1,
                  title: 'Take services and Pay for them',
                ),
                Onboarding2(
                  image: AppImages.onboarding_2,
                  title: 'Khobraa Services allow users to',
                  subtitle: 'find services in',
                ),
                Onboarding3(
                  image: AppImages.onboarding_3,
                  title: '10000+ Professionals here in',
                  subtitle: 'this Platform',
                ),
              ],
            ),
            Positioned(
              bottom: 230,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalpages, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentpages == index ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentpages == index
                          ? AppColors.purple
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 250,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    if (currentpages < totalpages - 1) {
                      _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>LoginScreen()),
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
