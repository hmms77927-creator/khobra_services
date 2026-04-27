// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/Controller/auth_controller.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   // List Pages = [1, 2, 3];
//   final controller =Get.put(ServiceController());
//   @override
//   void initState() {
//
//     super.initState();
//     controller.fetchServices();
//   }
//
//
//   /// 🔥 IMAGE FIX
//   Widget buildImage(String image) {
//     if (image.isEmpty) {
//       return Image.asset(
//         "assets/profile.png",
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: 180,
//       );
//     }
//
//     if (image.startsWith("http")) {
//       return Image.network(
//         image,
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: 180,
//         errorBuilder: (_, __, ___) =>
//             Image.asset("assets/profile.png"),
//       );
//     }
//
//     if (image.startsWith("/")) {
//       return Image.file(
//         File(image),
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: 180,
//         errorBuilder: (_, __, ___) =>
//             Image.asset("assets/profile.png"),
//       );
//     }
//
//     return Image.asset(
//       "assets/profile.png",
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: 180,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         title: Column(
//           children: [
//             Container(
//               child: Align(
//                 alignment: .topLeft,
//                 child: Text(
//                   'Hi, IQRA',
//                   style: TextStyle(
//                     color: AppColors.black,
//                     fontSize: 24,
//                     fontWeight: .w600,
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: .topLeft,
//               child: Container(
//                 child: Text(
//                   'What Would you like to search below?',
//                   style: TextStyle(
//                     color: AppColors.lightBlack,
//                     fontSize: 13,
//                     fontWeight: .w700,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: AppColors.white,
//         actions: [Icon(Icons.notifications_outlined, color: AppColors.purple)],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: HomeField(hintText: 'Search for..', onPressed: () {}),
//             ),
//             Obx(() {
//               final list = controller.serviceList;
//
//               if (list.isEmpty) {
//                 return const Center(child: Text("No Services Found"));
//               }
//
//               return ListView.builder(
//                 itemCount: list.length,
//                 itemBuilder: (context, index) {
//                   final item = list[index];
//                   return Card(
//                     color: AppColors.white,
//                     margin: const EdgeInsets.all(10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: BorderSide(width: 0.5,color: AppColors.lightBlack),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// 🔥 IMAGE
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: buildImage(item["image"] ?? ""),
//                           ),
//                         ),
//                   HomeCard(
//                           // image: AppImages.home1,
//                           text:  item["serviceName"] ?? "",
//                           subtext: "${item["hours"] ?? ''} ${item["minutes"] ?? ''}",
//                           title: item["price"],
//                           subtitle: '4.2',
//                           description: 'duration',
//                           subdescription:"${item["hours"] ?? ''} ${item["minutes"] ?? ''}",
//                           onPressed: () {},
//                           onTap: () {},
//                         ),
//                         // CustomBookcontainer(
//                         //   text: item["serviceName"] ?? "",
//                         //   subtext: item["category"] ?? "",
//                         //   title: item["address"] ?? "",
//                         //   subtitle:
//                         //   "${item["hours"] ?? ''} ${item["minutes"] ?? ''}",
//                         //   description:
//                         //   "Status: ${item["status"] ?? "Start"}",
//                          // ignore (we already show above)
//                         //   onPressed: () {},
//                         //   onTap: () {},
//                         // ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Controller/auth_controller.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
    controller.fetchServices();
  }

  /// 🔥 IMAGE FIX (FINAL)
  Widget buildImage(String image) {
    if (image.isEmpty) {
      return Image.asset(
        "assets/profile.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
      );
    }

    if (image.startsWith("http")) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    }

    if (image.startsWith("/")) {
      return Image.file(
        File(image),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    }

    return Image.asset(
      "assets/profile.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: 180,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      /// 🔥 APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, IQRA',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'What would you like to search?',
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications_outlined, color: AppColors.purple)
        ],
      ),

      /// 🔥 BODY
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: HomeField(hintText: 'Search for..', onPressed: () {}),
            ),
          Obx(() {
            final list = controller.serviceList;

            if (list.isEmpty) {
              return const Center(child: Text("No Services Found"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];

                return Card(
                  color: AppColors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      width: 0.5,
                      color: AppColors.lightBlack,
                    ),
                  ),
                  child:
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: SizedBox(
                                height: 130,
                                width: 130,
                                child: buildImage(item["image"] ?? ""),
                              ),
                            ),
                          ),
                      /// 🔥 CONTENT
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: HomeCard(
                          text: item["serviceName"] ?? "",
                          subtext:
                          "${item["hours"] ?? ''}h ${item["minutes"] ?? ''}m",
                          title: item["price"] ?? "",
                          subtitle: '4.2',
                          description: 'Duration',
                          subdescription:
                          "${item["hours"] ?? ''}h ${item["minutes"] ?? ''}m",
                          onPressed: () {}, image: '', onTap: () {  },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}