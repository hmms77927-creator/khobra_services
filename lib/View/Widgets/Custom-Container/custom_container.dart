import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final Color color;
  const CustomContainer({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 13, fontWeight: .w800, color: color),
      ),
    );
  }
}

// Header Text
class HeaderContainer extends StatelessWidget {
  final String text;
  const HeaderContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.purple,
          fontSize: 26.19,
          fontWeight: .w700,
        ),
      ),
    );
  }
}

class ForgotText extends StatelessWidget {
  final String text;
  final String title;
  const ForgotText({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.neutral,
              fontSize: 12.22,
              fontWeight: .w400,
            ),
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.neutral,
              fontSize: 12.22,
              fontWeight: .w400,
            ),
          ),
        ),
      ],
    );
  }
}

// TextField Text
class TextfieldText extends StatelessWidget {
  final String text;
  final Color color;

  const TextfieldText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12.22, fontWeight: .w600),
      ),
    );
  }
}

class ResendContainer extends StatelessWidget {
  final String text;
  final String title;
  final Color titlecolor;
  final String subtitle;
  final Color subtitlecolor;
  final Color color;
  const ResendContainer({
    super.key,
    required this.text,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.titlecolor,
    required this.subtitlecolor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 12.22,
                  fontWeight: .w400,
                ),
              ),
            ),
            Container(
              child: Text(
                title,
                style: TextStyle(
                  color: titlecolor,
                  fontSize: 12,
                  fontWeight: .w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            subtitle,
            style: TextStyle(
              color: subtitlecolor,
              fontSize: 12.22,
              fontWeight: .w400,
            ),
          ),
        ),
      ],
    );
  }
}

class textfieldheading extends StatelessWidget {
  final String text;
  final Color color;
  const textfieldheading({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 12.36, fontWeight: .w400, color: color),
      ),
    );
  }
}

class formheader extends StatelessWidget {
  final String text;
  final Color color;
  const formheader({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: .w700, color: color),
      ),
    );
    ;
  }
}

class FillForm extends StatelessWidget {
  final String text;
  final Color color;

  const FillForm({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: .w600, color: color),
      ),
    );
  }
}

// Appbar Text
class AppbarText extends StatelessWidget {
  final String text;
  final Color color;

  const AppbarText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: .w600, color: color),
      ),
    );
  }
}

// Profile Text
class ProfileText extends StatelessWidget {
  final String text;
  final Color color;
  const ProfileText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 13, fontWeight: .w700, color: color),
      ),
    );
  }
}

// History
class Historycard extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onPressed;

  const Historycard({
    super.key,
    required this.text,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(AppImages.history),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Details Text
class DetailText extends StatelessWidget {
  final String text;
  final String title;
  const DetailText({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 15,
                fontWeight: .w600,
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 14,
                fontWeight: .w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Terms & Conditions
class TermsContainer extends StatelessWidget {
  final String text;
  final Color color;
  const TermsContainer({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 20, fontWeight: .w600),
      ),
    );
  }
}

class ConditionContainer extends StatelessWidget {
  final String text;
  const ConditionContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.lightBlack,
          fontSize: 15,
          fontWeight: .w700,
        ),
      ),
    );
  }
}

// Custom Container Button
class CustomContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontsize;
  final FontWeight fontweight;
  const CustomContainerButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.fontsize,
    required this.fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 95,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.pureblack.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, -4),
          ),
        ],
      ),
      alignment: .center,
      child: SizedBox(
        width: 180,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: fontsize,
              fontWeight: fontweight,
            ),
          ),
        ),
      ),
    );
  }
}

// Intro Screen
class IntroScreen extends StatelessWidget {
  final String title;
  final String substitle;
  const IntroScreen({super.key, required this.title, required this.substitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}

// Earning container
class EarningContainer extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final String description;
  const EarningContainer({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: AppColors.black),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: Container(
                  child: Text(
                    'Payment Method :',
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontSize: 16,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
                child: Container(
                  child: Text(
                    'Cash',
                    style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 16,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 15),
            child: Align(
              alignment: .topLeft,
              child: Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.fullgrey,
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 15,
              right: 15,
              bottom: 20,
            ),
            child: Card(
              color: AppColors.cardcolor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            child: Text(
                              subtext,
                              style: TextStyle(
                                color: AppColors.textcolor,
                                fontSize: 14,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: AppColors.purple,
                                fontSize: 14,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            child: Text(
                              subtitle,
                              style: TextStyle(
                                color: AppColors.textcolor,
                                fontSize: 14,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            child: Text(
                              description,
                              style: TextStyle(
                                color: AppColors.purple,
                                fontSize: 14,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// provider profile
class ProviderProfile extends StatelessWidget {
  final String text;
  final String subtext;
  const ProviderProfile({super.key, required this.text, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 22,
              fontWeight: .w500,
            ),
          ),
        ),
        Container(
          child: Text(
            subtext,
            style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 16,
              fontWeight: .w500,
            ),
          ),
        ),
      ],
    );
  }
}

// CustomBookcontainer
class CustomBookcontainer extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final String description;
  final VoidCallback onTap;

  const CustomBookcontainer({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.onTap,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(43),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      '#123',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  child: Text(
                    'Rs120',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Container(
                  child: Text(
                    'Rs120',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 12,
                      fontWeight: .w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(Icons.location_on),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Text(
                    subtext,
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontSize: 12,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(Icons.calendar_today),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 12,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 12,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.dividercolor, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 15),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                SizedBox(
                  width: 141,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      description,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 141,
                  height: 38,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.fieldcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// booking services containers
class headingcon extends StatelessWidget {
  final String text;
  final Color color;
  const headingcon({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 16, fontWeight: .w500),
      ),
    );
  }
}

class divicontainer extends StatelessWidget {
  const divicontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303,
      child: Divider(color: AppColors.dividercolor, thickness: 1),
    );
  }
}

class head2cont extends StatelessWidget {
  final String text;
  final Color color;
  const head2cont({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 18, fontWeight: .w500),
      ),
    );
  }
}

class subcontainer extends StatelessWidget {
  final String text;
  final Color color;
  const subcontainer({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 14, fontWeight: .w500),
      ),
    );
  }
}

// Home Provider
class homeProvidercontain extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  const homeProvidercontain({
    super.key,
    required this.text,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.dividercolor),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Container(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 22,
                      fontWeight: .w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.fieldcolor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Image.asset(image),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.fullgrey,
                  fontSize: 12,
                  fontWeight: .w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class servicetext extends StatelessWidget {
  final String text;
  final Color color;
  const servicetext({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12, fontWeight: .w500),
      ),
    );
  }
}

// service home
class serviceshome extends StatelessWidget {
  final String image;
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  const serviceshome({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      subtext,
                      style: TextStyle(
                        color: AppColors.fullgrey,
                        fontSize: 12,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: .start,
                children: [
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Container(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.fullgrey,
                        fontSize: 14,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.fullgrey,
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// BottomSheet
class Bottomsheetcontainer extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final Color color;
  const Bottomsheetcontainer({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.fullgrey,
                    fontSize: 16,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                child: Text(
                  subtext,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 20),
              child: Container(
                height: 100,
                width: 2,
                decoration: DottedDecoration(
                  shape: Shape.line,
                  linePosition: .left,
                  strokeWidth: 2,
                  color: color,
                  dash: [6, 6],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: .w500,
                  ),
                ),
              ),
              Container(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.fullgrey,
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
