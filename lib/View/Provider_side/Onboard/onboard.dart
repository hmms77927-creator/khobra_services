import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Onboard/intro.dart';
import 'package:flutter_application_newproject/View/Provider_side/Onboard/onboard_1.dart';
import 'package:flutter_application_newproject/View/Provider_side/Onboard/onboard_2.dart';
import 'package:flutter_application_newproject/View/Provider_side/Onboard/onboard_3.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController _pageController = PageController();
  int currentpages = 0;
  int totalpages = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Onboard1(
                  image: AppImages.onboarding_1,
                  title: 'Do service for customers and',
                  subtitle: 'take Money',
                ),
                Onboard2(
                  image: AppImages.onboarding_2,
                  title: 'Khobra Services allow you to',
                  subtitle: 'find services in',
                ),
                onboard3(
                  image: AppImages.onboarding_3,
                  title: '10000+  Jobs here in this ',
                  subtitle: 'Platform',
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
                        MaterialPageRoute(builder: (context) => Intro()),
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
