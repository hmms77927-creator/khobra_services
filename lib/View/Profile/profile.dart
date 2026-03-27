// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/Constant/app-images.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         title: AppbarText(
//           text: 'Profile',
//           color: const Color.fromARGB(255, 116, 68, 68),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: IconButton(
//               style: IconButton.styleFrom(
//                 backgroundColor: AppColors.purple,
//                 shape: CircleBorder(),
//               ),
//               onPressed: () {},
//               icon: Icon(Icons.person, color: AppColors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(AppImages.profile),
//             ),
//           ),
//           formheader(text: 'Fardeen ', color: AppColors.black),
//           ProfileText(
//             text: 'Created : 5/Febuary/2025',
//             color: AppColors.lightBlack,
//           ),
//           ProfileButton(
//             text: 'Edit Profile',
//             image: AppImages.Edit,
//             w: 16,
//             h: 20,
//             onTap: () {},
//           ),
//           ProfileButton(
//             text: 'Terms & Conditions',
//             image: 'asset/icons/Protection.svg',
//             w: 16,
//             h: 18,
//             onTap: () {},
//           ),
//           ProfileButton(
//             text: 'Help Center',
//             image: 'asset/icons/helpcenter.svg',
//             w: 19,
//             h: 19,
//             onTap: () {},
//           ),
//           ProfileButton(
//             text: 'Logout',
//             image: 'asset/icons/logout.png',
//             w: 15,
//             h: 13,
//             onTap: () {},
//           ),
//           DeleteButton(text: 'Delete Account', onTap: () {}),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_svg/flutter_svg.dart'; // for SVG support

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              icon: Icon(Icons.person, color: AppColors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(AppImages.profile),
            ),
            const SizedBox(height: 10),
            formheader(text: 'Fardeen ', color: AppColors.black),
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
              onTap: () {},
            ),
            ProfileButton(
              text: 'Terms & Conditions',
              image: 'assets/icons/Protection.svg', // fixed path
              w: 16,
              h: 18,
              onTap: () {},
            ),
            ProfileButton(
              text: 'Help Center',
              image: 'assets/icons/helpcenter.svg', // fixed path
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
            DeleteButton(text: 'Delete Account', onTap: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
