// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Column(
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 39.0),
//               child: Container(
//                 width: 320,
//                 height: 320,
//                 child: Image.asset(AppImages.home1, fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: DashboardCard(
//               text: 'Cleaning',
//               subtitle: '4.2 ',
//               title: 'Cleaning',
//               description: 'Minimun Two Hours',
//               onPressed: () {},
//               onTap: () {},
//               doubleTap: () {},
//               subdescription: 'Rs 705/-',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
// import 'package:get/get.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//
//   final data = Get.arguments ?? {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//             /// 🖼 IMAGE SECTION
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 39.0),
//                 child: Container(
//                   width: 320,
//                   height: 320,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: (data["image"] ?? "").toString().startsWith("http")
//                       ? Image.network(
//                     data["image"],
//                     fit: BoxFit.cover,
//                   )
//                       : Image.asset(
//                     AppImages.home1,
//                     fit: BoxFit.cover,
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final data = Get.arguments ?? {};

  Widget buildImage(String img) {
    if (img.isEmpty) {
      return Image.asset(AppImages.home1, fit: BoxFit.cover);
    }

    if (img.startsWith("http")) {
      return Image.network(img, fit: BoxFit.cover);
    }

    if (img.startsWith("/")) {
      return Image.file(File(img), fit: BoxFit.cover);
    }

    return Image.asset(AppImages.home1, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    final image = data["image"] ?? "";
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 39.0),
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildImage(image),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DashboardCard(
                text: data["text"] ?? "",
                subtitle: data["subtitle"] ?? "",
                title: data["title"] ?? "",
                description: data["description"] ?? "",
                subdescription: data["subdescription"] ?? "",
                onPressed: () {},
                onTap: () {},
                doubleTap: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}