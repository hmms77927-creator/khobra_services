// class Profile extends StatelessWidget {
//   Profile({super.key});
//
//   final controller = Get.put(UserController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: AppColors.white,
//
//       appBar: AppBar(
//         title: AppbarText(
//           text: 'Profile',
//           color: const Color.fromARGB(255, 116, 68, 68),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColors.white,
//         automaticallyImplyLeading: false,
//
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: IconButton(
//               style: IconButton.styleFrom(
//                 backgroundColor: AppColors.purple,
//                 shape: const CircleBorder(),
//               ),
//               onPressed: () {
//                 Get.to(() => DentalOfficeForm());
//               },
//               icon: Icon(Icons.person, color: AppColors.white),
//             ),
//           ),
//         ],
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//
//             // PROFILE IMAGE
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(AppImages.profile),
//             ),
//
//             const SizedBox(height: 10),
//
//             // 🔥 FIRESTORE NAME FIXED
//             Obx(() {
//               final user = controller.currentUser.value;
//
//               if (user == null) {
//                 return const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               return formheader(
//                 text: user.name, // 🔥 FIRESTORE NAME
//                 color: AppColors.black,
//               );
//             }),
//
//             ProfileText(
//               text: 'Created : 5/Febuary/2025',
//               color: AppColors.lightBlack,
//             ),
//
//             const SizedBox(height: 20),
//
//             ProfileButton(
//               text: 'Edit Profile',
//               image: AppImages.Edit,
//               w: 16,
//               h: 20,
//               onTap: () {
//                 Get.to(() => DentalOfficeForm());
//               },
//             ),
//
//             ProfileButton(
//               text: 'Terms & Conditions',
//               image: 'assets/icons/Protection.svg',
//               w: 16,
//               h: 18,
//               onTap: () {},
//             ),
//
//             ProfileButton(
//               text: 'Help Center',
//               image: 'assets/icons/helpcenter.svg',
//               w: 19,
//               h: 19,
//               onTap: () {},
//             ),
//
//             ProfileButton(
//               text: 'Logout',
//               image: 'assets/icons/logout.png',
//               w: 15,
//               h: 13,
//               onTap: () {},
//             ),
//
//             const SizedBox(height: 20),
//
//             DeleteButton(
//               text: 'Delete Account',
//               onTap: () {},
//             ),
//
//             const SizedBox(height: 30),
//           ],
//
// ),
//       ),
//     );
//   }
// }
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/app-colors.dart';
import '../../Constant/app-images.dart';
import '../../Controller/auth_controller.dart';
import '../Dental-Office/dental_office_form.dart';
import '../Widgets/App-Buttons/custom-Buttons.dart';
import '../Widgets/Custom-Container/custom_container.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppbarText(
          text: 'Profile',
          color: const Color.fromARGB(255, 116, 68, 68),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: const CircleBorder(),
              ),
              onPressed: () {
                Get.to(() =>FormScreen());
              },
              icon: Icon(Icons.person, color: AppColors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          final user = controller.currentUser.value;
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: user.image != null && user.image.isNotEmpty
                    ? FileImage(File(user.image))
                    : const AssetImage("assets/profile.png") as ImageProvider,
              ),
              const SizedBox(height: 10),
              Text(
                user.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ProfileText(
                text: 'Created : 5/Febuary/2025',
                color: AppColors.lightBlack,
              ),

              const SizedBox(height: 20),

              ProfileButton(
                text: 'Edit Profile',
                image: AppImages.Edit,
                w: 16,
                h: 20,
                onTap: () {
                  Get.to(() => FormScreen());
                },
              ),

              ProfileButton(
                text: 'Terms & Conditions',
                image: 'assets/icons/Protection.svg',
                w: 16,
                h: 18,
                onTap: () {},
              ),

              ProfileButton(
                text: 'Help Center',
                image: 'assets/icons/helpcenter.svg',
                w: 19,
                h: 19,
                onTap: () {},
              ),

              ProfileButton(
                text: 'Logout',
                image: 'assets/icons/logout.png',
                w: 15,
                h: 13,
                onTap: () {},
              ),

              const SizedBox(height: 20),

              DeleteButton(
                text: 'Delete Account',
                onTap: () {},
              ),
            ],
          );
        }),
      ),
    );
  }
  ImageProvider getImage(String img) {
    if (img.isEmpty) {
      return const AssetImage("assets/profile.png");
    }

    // 🔥 URL case
    if (img.startsWith("http")) {
      return NetworkImage(img);
    }

    // 🔥 LOCAL FILE (your case)
    return FileImage(File(img));
  }
  }
//   ImageProvider _getImage(String img) {
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