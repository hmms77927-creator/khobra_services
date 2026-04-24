// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// class HandymanList extends StatefulWidget {
//   const HandymanList({super.key});
//
//   @override
//   State<HandymanList> createState() => _HandymanListState();
// }
//
// class _HandymanListState extends State<HandymanList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 140,
//         leading: TextButton.icon(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
//           label: Text(
//             'Driver List',
//             style: TextStyle(
//               color: AppColors.white,
//               fontSize: 16,
//               fontWeight: .w600,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(AddDriverScreen());
//             },
//             icon: Icon(Icons.add, color: AppColors.white),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 5.0,
//                 right: 5,
//                 bottom: 5,
//                 top: 10,
//               ),
//               child: handymancard(
//                 text: 'Fatime         ',
//                 subtext: 'fatima@gmail.com',
//                 title: '1901 Township\n Lahore ',
//                 subtitle: '03209876523',
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddDriverScreen()),
//                   );
//                 },
//                 image: AppImages.booking,
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: handymancard(
//                 text: 'John Missder',
//                 subtext: 'john@gmail.com',
//                 title: '876 10th Street\n GreenCap Lahore  ',
//                 subtitle: '0320987655',
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>AddDriverScreen()),
//                   );
//                 },
//                 image: AppImages.handyman_2,
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: handymancard(
//                 text: 'Sidra Khan ',
//                 subtext: 'sidra@gmail.com',
//                 title: 'Behria Town Lahore',
//                 subtitle: '0324738393',
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddDriverScreen()),
//                   );
//                 },
//                 image: AppImages.handyman_3,
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
//
// import '../../../Controller/auth_controller.dart';
//
// class HandymanList extends StatefulWidget {
//   const HandymanList({super.key});
//
//   @override
//   State<HandymanList> createState() => _HandymanListState();
// }
//
// class _HandymanListState extends State<HandymanList> {
//   final controller = Get.put(DriverController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//
//       // ---------------- APP BAR ----------------
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 140,
//         leading: TextButton.icon(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           label: const Text(
//             'Driver List',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//
//         // ---------------- ADD BUTTON ----------------
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => AddDriverScreen());
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//           ),
//         ],
//       ),
//
//       // ---------------- BODY (FIRESTORE LIST) ----------------
//       body: Obx(() {
//         final list = controller.driverList;
//
//         if (list.isEmpty) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             final driver = list[index];
//
//             return Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: handymancard(
//                 text: driver.name,
//                 subtext: driver.email,
//                 title: driver.city,
//                 subtitle: driver.phone,
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddDriverScreen(),
//                     ),
//                   );
//                 },
//
//                 image: AppImages.booking, // later: driver.image add kar sakte ho
//
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//
//                 onTap: () {
//                   // TODO: activate logic
//                 },
//
//                 onDoubleTap: () {
//                   // TODO: deactivate logic
//                 },
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//   ImageProvider getImage(String img) {
//     if (img.isEmpty) {
//       return const AssetImage("assets/profile.png");
//     }
//
//     if (img.startsWith("http")) {
//       return NetworkImage(img);
//     }
//
//     return FileImage(File(img));
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
//
// import '../../../Controller/auth_controller.dart';
//
// class HandymanList extends StatefulWidget {
//   const HandymanList({super.key});
//
//   @override
//   State<HandymanList> createState() => _HandymanListState();
// }
//
// class _HandymanListState extends State<HandymanList> {
//   final controller = Get.put(DriverController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//
//       // ---------------- APP BAR ----------------
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 140,
//         leading: TextButton.icon(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           label: const Text(
//             'Driver List',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//
//         // ---------------- ADD BUTTON ----------------
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => AddDriverScreen());
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//           ),
//         ],
//       ),
//
//       // ---------------- BODY (FIRESTORE LIST) ----------------
//       body: Obx(() {
//         final list = controller.driverList;
//
//         if (list.isEmpty) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             final driver = list[index];
//
//             return Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: handymancard(
//                 text: driver.name,
//                 subtext: driver.email,
//                 title: driver.city,
//                 subtitle: driver.phone,
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddDriverScreen(),
//                     ),
//                   );
//                 },
//
//                 // ---------------- IMAGE FIXED ----------------
//                 image: getImage(driver.image),
//
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   // ---------------- IMAGE HANDLER (FIXED) ----------------
//   ImageProvider getImage(String img) {
//     if (img.isEmpty) {
//       return const AssetImage("assets/profile.png");
//     }
//
//     // Network image (Firestore URL)
//     if (img.startsWith("http")) {
//       return NetworkImage(img);
//     }
//
//     // Local file image
//     return FileImage(File(img));
//   }
// }


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
//
// import '../../../Controller/auth_controller.dart';
//
// class HandymanList extends StatefulWidget {
//   const HandymanList({super.key});
//
//   @override
//   State<HandymanList> createState() => _HandymanListState();
// }
//
// class _HandymanListState extends State<HandymanList> {
//   final controller = Get.put(DriverController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//
//       // ---------------- APP BAR ----------------
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 140,
//         leading: TextButton.icon(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           label: const Text(
//             'Driver List',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//
//         // ---------------- ADD BUTTON ----------------
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => AddDriverScreen());
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//           ),
//         ],
//       ),
//
//       // ---------------- BODY ----------------
//       body: Obx(() {
//         final list = controller.driverList;
//
//         if (list.isEmpty) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             final driver = list[index];
//
//             return Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: handymancard(
//                 text: driver.name,
//                 subtext: driver.email,
//                 title: driver.city,
//                 subtitle: driver.phone,
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//
//                 // ---------------- IMAGE FIXED ----------------
//                 image: getImage(driver.image),
//
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddDriverScreen(),
//                     ),
//                   );
//                 },
//
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   // ---------------- IMAGE HANDLER (100% SAFE) ----------------
//   ImageProvider getImage(String img) {
//     if (img.isEmpty) {
//       return const AssetImage("assets/profile.png");
//     }
//
//     if (img.startsWith("http") || img.startsWith("https")) {
//       return NetworkImage(img);
//     }
//
//     return FileImage(File(img));
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
//
// import '../../../Controller/auth_controller.dart';
//
// class HandymanList extends StatefulWidget {
//   const HandymanList({super.key});
//
//   @override
//   State<HandymanList> createState() => _HandymanListState();
// }
//
// class _HandymanListState extends State<HandymanList> {
//   final controller = Get.put(DriverController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//
//       // ---------------- APP BAR ----------------
//       appBar: AppBar(
//         backgroundColor: AppColors.purple,
//         leadingWidth: 140,
//         leading: TextButton.icon(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           label: const Text(
//             'Driver List',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => AddDriverScreen());
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//           ),
//         ],
//       ),
//
//       // ---------------- BODY ----------------
//       body: Obx(() {
//         final list = controller.driverList;
//
//         if (list.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         return ListView.builder(
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             final driver = list[index];
//
//             return Padding(
//               padding: const EdgeInsets.all(6),
//               child: handymancard(
//                 text: driver.name,
//                 subtext: driver.email,
//                 title: driver.city,
//                 subtitle: driver.phone,
//                 color: AppColors.fullgrey,
//                 textcolor: AppColors.black,
//
//                 // ---------------- IMAGE FIX (NO ERROR) ----------------
//                 image: driver.image.isEmpty
//                     ? AppImages.profile
//                     : driver.image,
//
//                 buttontext: 'Deactivate',
//                 subbuttontext: 'Activate',
//
//                 onPressed: () {
//                   Get.to(() => AddDriverScreen());
//                 },
//
//                 onTap: () {},
//                 onDoubleTap: () {},
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';

import '../../../Controller/auth_controller.dart';

class HandymanList extends StatefulWidget {
  const HandymanList({super.key});

  @override
  State<HandymanList> createState() => _HandymanListState();
}

class _HandymanListState extends State<HandymanList> {
  final controller = Get.put(DriverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          label: const Text('Driver List'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AddDriverScreen());
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

      // ---------------- BODY ----------------
      body: Obx(() {
        final list = controller.driverList;

        if (list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final driver = list[index];

            return Padding(
              padding: const EdgeInsets.all(5),
              child: handymancard(
                text: driver.name,
                subtext: driver.email,
                title: driver.city,
                subtitle: driver.phone,
                color: AppColors.fullgrey,
                textcolor: AppColors.black,

                // ---------------- IMAGE FIXED ----------------
                imageWidget: buildImage(driver.image),

                buttontext: 'Deactivate',
                subbuttontext: 'Activate',

                onPressed: () {
                  Get.to(() => AddDriverScreen());
                },

                onTap: () {},
                onDoubleTap: () {},image: driver.image,
              ),
            );
          },
        );
      }),
    );
  }

  // ---------------- IMAGE HELPER (INSIDE SAME SCREEN) ----------------
  Widget buildImage(String img) {
    if (img.isEmpty) {
      return Image.asset(
        "assets/profile.png",
        fit: BoxFit.cover,
      );
    }

    if (img.startsWith("http")) {
      return Image.network(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset("assets/profile.png");
        },
      );
    }

    return Image.file(
      File(img),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset("assets/profile.png");
      },
    );
  }
}
