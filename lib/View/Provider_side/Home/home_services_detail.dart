import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/add_services.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_rewive.dart';
import 'package:flutter_application_newproject/View/Provider_side/Services/my_services.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class HomeServicesDetail extends StatefulWidget {
  const HomeServicesDetail({super.key});
  @override
  State<HomeServicesDetail> createState() => _HomeServicesDetailState();
}

class _HomeServicesDetailState extends State<HomeServicesDetail> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.45,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(AppImages.wiring_3, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddServices(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.more_horiz,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 240,
                    left: 16,
                    right: 16,
                    child: Homeservicescard(
                      text: '₹500',
                      subtext: '10% off',
                      title: 'Duration :',
                      subtitle: '01 Hour',
                      description: 'Rating :',
                      subdescription: '4.5',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: head2cont(
                      text: 'Description',
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  subcontainer(
                    text:
                        'It is a long established fact that a reader will be\n distracted by the readable content of a page\n when looking at its layout.',
                    color: AppColors.fullgrey,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: AppColors.fieldcolor,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              head2cont(
                                text: 'Gallery',
                                color: AppColors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyServices(),
                                    ),
                                  );
                                },
                                child: subcontainer(
                                  text: 'View All',
                                  color: AppColors.fullgrey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.wiring),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.wiring_2),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.wiring_4),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 25,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.purple,
                                      ),
                                      child: Image.asset(AppImages.star),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      head2cont(text: 'Reviews', color: AppColors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeRewive(),
                            ),
                          );
                        },
                        child: servicetext(
                          text: 'View All',
                          color: AppColors.fullgrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  serviceshome(
                    text: 'Donna Bins',
                    subtext: '02 Dec',
                    title: '4.5',
                    subtitle:
                        'It is a long established fact that a\n reader will be distracted by the\n readable content of a page',
                    image: AppImages.serviceshome1,
                  ),
                  SizedBox(height: 10),
                  serviceshome(
                    text: 'Ashutosh Pandey',
                    subtext: '05 Jan',
                    title: '4.5',
                    subtitle:
                        'It is a long established fact that a\n reader will be distracted by the\n readable content of a page',
                    image: AppImages.serviceshome2,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
