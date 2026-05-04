// home card
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/app-colors.dart';
import '../../../Constant/app-images.dart';
import '../../Provider_side/Services/earning_list.dart';



class HomeCard extends StatelessWidget {
  final String image;
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final String description;
  final String subdescription;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final VoidCallback ontap;

  const HomeCard({
    super.key,
    required this.image,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.subdescription,
    required this.onPressed, required this.onTap, required this.ontap,
  });

  Widget buildImage() {
    if (image.isEmpty) {
      return Image.asset("assets/profile.png", fit: BoxFit.cover);
    } else if (image.startsWith("http")) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    } else if (image.startsWith("/")) {
      return Image.file(
        File(image),
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    } else {
      return Image.asset("assets/profile.png", fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),

        child: Row(
          children: [

            /// IMAGE (FIXED)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: SizedBox(
                width: 120,
                height: double.infinity,
                child: buildImage(),
              ),
            ),

            /// RIGHT SIDE
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    /// TOP CONTENT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),


                        Text(
                          subtext,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),

                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color:AppColors.lightYellow ,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.star,
                                  size: 14, color: Colors.orange),
                              Flexible(
                                child: GestureDetector(
                                  onTap: ontap,
                                  child: Text(
                                    "$subtitle • $description • $subdescription",
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(Icons.bookmark,
                    color: AppColors.darkblue),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        "Book Now",
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}



// Dashboard Card
class DashboardCard extends StatelessWidget {
  final String text;
  final String title;
  final String subtitle;
  final String description;
  final String subdescription;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final VoidCallback doubleTap;

  const DashboardCard({
    super.key,
    required this.text,

    required this.subtitle,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.onTap,
    required this.doubleTap,
    required this.subdescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.fullblue,
                      fontSize: 12,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.bookmark),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 240.0),
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: .w600,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Icon(Icons.star, color: AppColors.yellow),
              Container(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 11,
                    fontWeight: .w800,
                  ),
                ),
              ),
              IconButton(onPressed: onPressed, icon: Icon(Icons.watch)),
              Container(
                child: Text(
                  description,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 11,
                    fontWeight: .w800,
                  ),
                ),
              ),
              Container(
                child: Text(
                  subdescription,
                  style: TextStyle(
                    color: AppColors.lightYellow,
                    fontSize: 21,
                    fontWeight: .w800,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170.0),
            child: SizedBox(
              width: 180,
              height: 52,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFE8F1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(2),
                  ),
                ),
                onPressed: onTap,
                child: Text(
                  'About',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              'Cleaning now a popular profession cleaning by off\n your carrer about tantas regiones barbarorum\n pedibus obiit',
              style: TextStyle(
                color: AppColors.light,
                fontSize: 13,
                fontWeight: .w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 180,
              height: 52,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFE8F1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(2),
                  ),
                ),
                onPressed: doubleTap,
                child: Text(
                  'Book Now ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Employee Request
class EmployeeCard extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onPressed;
  final ValueChanged<bool?> onChanged;
  final bool value;

  const EmployeeCard({
    super.key,
    required this.text,
    required this.title,
    required this.onPressed,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 84,
      child: Card(
        color: AppColors.white,
        elevation: 4,
        child: Row(
          children: [
            Checkbox(value: value, onChanged: onChanged),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AppImages.employee),
            ),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 108,
              height: 28,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Request',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
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

// Review Card
class Reviewcard extends StatelessWidget {
  final String text;
  final String title;
  final String subtitle;
  final String descrption;
  final String subdescrption;
  final String presubdescrption;
  final VoidCallback onPressed;
  const Reviewcard({
    super.key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.descrption,
    required this.subdescrption,
    required this.onPressed,
    required this.presubdescrption,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 219,
      child: Card(
        color: AppColors.white,
        elevation: 4,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.pureblack,
                      fontSize: 20,
                      fontWeight: .w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.edit_note),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(AppImages.home1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: .w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: .w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          descrption,
                          style: TextStyle(
                            color: AppColors.red,
                            fontWeight: .w800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              subdescrption,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: .w800,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              presubdescrption,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: .w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Booked
class BookedCard extends StatelessWidget {
  final String text;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const BookedCard({
    super.key,
    required this.text,
    required this.title,
    required this.onTap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 84,
      child: Card(
        color: AppColors.white,
        elevation: 4,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.employee),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Column(
                  children: [
                    Icon(Icons.edit),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 15,
                          fontWeight: .w600,
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

// Booking Card

class BookindCard extends StatelessWidget {
  final String text;
  final String image;
  final String title;
  final String subtitle;
  final String descrption;
  final VoidCallback onPressed;

  const BookindCard({
    super.key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.descrption,
    required this.onPressed,
    required this.image,
  });

  Widget buildImage(String img) {
    if (img.isEmpty) {
      return Image.asset(
        "assets/profile.png",
        width: 130,
        height: 130,
        fit: BoxFit.cover,
      );
    }

    // Network image
    if (img.startsWith("http")) {
      return Image.network(
        img,
        width: 130,
        height: 130,
        fit: BoxFit.cover,
      );
    }

    // Local file path
    if (img.startsWith("/")) {
      return Image.file(
        File(img),
        width: 130,
        height: 130,
        fit: BoxFit.cover,
      );
    }

    // Asset image fallback
    return Image.asset(
      img,
      width: 130,
      height: 130,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
        color: AppColors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: buildImage(image),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),

                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 11)),

                  Row(
                    children: [
                      Text(subtitle,
                          style: const TextStyle(fontSize: 8)),

                      const SizedBox(width: 5),

                      Text(descrption,
                          style: const TextStyle(fontSize: 8)),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 121.12,
                      height: 31,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          )
                        ),
                        onPressed: onPressed,
                        child: const Text("Cancel",style: TextStyle(color: AppColors.white,fontSize: 12,fontWeight: FontWeight.w800),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class BookindCard extends StatelessWidget {
//   final String text;
//   final String image;
//   final String title;
//   final String subtitle;
//   final String descrption;
//   final VoidCallback onPressed;
//   const BookindCard({
//     super.key,
//     required this.text,
//     required this.title,
//     required this.subtitle,
//     required this.descrption,
//     required this.onPressed, required this.image,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
//       child: Card(
//         color: AppColors.white,
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadiusGeometry.only(
//                 topLeft: Radius.circular(16),
//                 bottomLeft: Radius.circular(16),
//               ),
//               child: Image.asset(
//                image,
//                 width: 130,
//                 height: 130,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 50.0),
//                   child: Container(
//                     child: Text(
//                       text,
//                       style: TextStyle(
//                         color: AppColors.pureblack,
//                         fontWeight: .w700,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Container(
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         color: AppColors.black,
//                         fontWeight: .w800,
//                         fontSize: 11,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: Container(
//                         child: Text(
//                           subtitle,
//                           style: TextStyle(
//                             color: AppColors.black,
//                             fontWeight: .w500,
//                             fontSize: 8,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, left: 10),
//                       child: Container(
//                         child: Text(
//                           descrption,
//                           style: TextStyle(
//                             color: AppColors.black,
//                             fontWeight: .w500,
//                             fontSize: 8,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0),
//                   child: Align(
//                     alignment: .bottomLeft,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.lightYellow,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadiusGeometry.circular(5),
//                         ),
//                       ),
//                       onPressed: onPressed,
//                       child: Text(
//                         'Cancle Booking',
//                         style: TextStyle(
//                           color: AppColors.white,
//                           fontSize: 12,
//                           fontWeight: .w800,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class NotifiCard1 extends StatelessWidget {
  final String text;
  final String title;

  const NotifiCard1({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: 345,
      child: Card(
        color: AppColors.lightskin,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppColors.pureblack,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Services Card
class ServicesCard extends StatelessWidget {
  final String text;
  final String title;
  final String image;
  const ServicesCard({
    super.key,
    required this.image,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fieldcolor,
      child: Column(
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              children: [
                Container(
                  width: 335,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 230,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(25),
                        side: BorderSide(color: AppColors.white, width: 3),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EarningList()),
                      );
                    },
                    child: Text(
                      '₹150',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: AppColors.yellow),
                      Icon(Icons.star, color: AppColors.yellow),
                      Icon(Icons.star, color: AppColors.yellow),
                      Icon(Icons.star, color: AppColors.yellow),
                      Icon(Icons.star, color: AppColors.yellow),
                      Text(
                        '4.3',
                        style: TextStyle(
                          color: AppColors.lightBlack,
                          fontSize: 14,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 210,
                  child: Container(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 16,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  child: Container(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 16,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 265,
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            AppImages.circle_services,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Iqra Iqbal',
                          style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 14,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ],
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

// book Notifications
class booknotifi extends StatelessWidget {
  final String text;
  final String title;
  final String subtitle;
  final Color color;
  final Color subcolor;
  final Color textcolor;
  final Color containcolor;
  const booknotifi({
    super.key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.subcolor,
    required this.textcolor,
    required this.containcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containcolor,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: .w500,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: subcolor,
                      fontSize: 12,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Text(
              subtitle,
              style: TextStyle(
                color: textcolor,
                fontSize: 14,
                fontWeight: .w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// handyman

class handymancard extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final String image;
  final Color color;
  final Color textcolor;
  final String buttontext;
  final String subbuttontext;
  final VoidCallback onPressed;
  final VoidCallback onTap;

  const handymancard({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.textcolor,
    required this.buttontext,
    required this.subbuttontext,
    required this.onPressed,
    required this.onTap,
  });

  /// 🔥 SAFE IMAGE HANDLER
  Widget buildImage(String img) {
    if (img.isEmpty) {
      return const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage("assets/profile.png"),
      );
    }

    if (img.startsWith("http")) {
      return CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(img),
      );
    }

    if (img.startsWith("/")) {
      return CircleAvatar(
        radius: 40,
        backgroundImage: FileImage(File(img)),
      );
    }

    return const CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage("assets/profile.png"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250,
        width: 334,
        child: Card(
          color: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildImage(image),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME + MENU
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                text,
                                style: TextStyle(
                                  color: textcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: onPressed,
                                icon: const Icon(Icons.more_horiz),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // EMAIL
                          Row(
                            children: [
                              const Icon(Icons.email, size: 18),
                              const SizedBox(width: 8),
                              Text(subtext),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // LOCATION
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 18),
                              const SizedBox(width: 8),
                              Text(title),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // PHONE
                          Row(
                            children: [
                              const Icon(Icons.call, size: 18),
                              const SizedBox(width: 8),
                              Text(subtitle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ================= BUTTONS =================
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 38,
                      width: 134,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: onTap,
                        child: Text(subbuttontext, style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: .w500,
                        ),),
                      ),
                    ),

                    const SizedBox(width: 10),

                    SizedBox(
                      height: 38,
                      width: 134,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: onTap,
                        child: Text(
                          buttontext,
                          style:TextStyle(
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
        ),
      ),
    );
  }
}

// customer Review Card
class customerReviewcard extends StatelessWidget {
  final String image;
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const customerReviewcard({
    super.key,
    required this.image,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335,
        height: 267,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.fieldcolor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        subtext,
                        style: TextStyle(
                          color: AppColors.fullgrey,
                          fontSize: 14,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.delete_outline, color: AppColors.purple),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 295,
              height: 153,
              child: Card(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: 295,
                        child: Divider(
                          color: AppColors.dividercolor,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColors.yellow),
                          Icon(Icons.star, color: AppColors.yellow),
                          Icon(Icons.star, color: AppColors.yellow),
                          Icon(Icons.star, color: AppColors.yellow),
                          Icon(Icons.star, color: AppColors.yellow),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              child: Text(
                                '4.5',
                                style: TextStyle(
                                  color: AppColors.fullgrey,
                                  fontSize: 14,
                                  fontWeight: .w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Container(
                              child: Text(
                                '25 Jan',
                                style: TextStyle(
                                  color: AppColors.fullgrey,
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
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Container(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: AppColors.fullgrey,
                            fontSize: 14,
                            fontWeight: .w500,
                          ),
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

// HomeService Ditail card
class Homeservicescard extends StatelessWidget {
  final String text;
  final String subtext;
  final String title;
  final String subtitle;
  final String description;
  final String subdescription;
  const Homeservicescard({
    super.key,
    required this.text,
    required this.subtext,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.subdescription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181,
      width: 335,
      child: Card(
        color: AppColors.white,
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: Text(
                    'TV Wall Mount Installation',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: .w700,
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
                            color: AppColors.fullgrey,
                            fontSize: 14,
                            fontWeight: .w600,
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
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 22,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 22,
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
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        child: Text(
                          description,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 22,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        child: Text(
                          subdescription,
                          style: TextStyle(
                            color: AppColors.fullgrey,
                            fontSize: 22,
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
    );
  }
}

// Add Services
class AddServicescard extends StatelessWidget {
  final String text;
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const AddServicescard({
    super.key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Switch(
                  activeThumbColor: AppColors.white,
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.purple,
                  value: value,
                  onChanged: onChanged,
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Bottom Row
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.fullgrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.fullgrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
