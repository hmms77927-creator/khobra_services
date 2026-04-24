import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/app-colors.dart';
import '../../../Constant/app-images.dart';
import '../../../Controller/auth_controller.dart';
import '../../Widgets/App-Buttons/custom-Buttons.dart';
import '../Handyman/handy_about.dart';
import '../Handyman/handy_change_password.dart';
import '../Handyman/handyman_list.dart';
import '../Login_provid/log.dart';
import '../Profile_Provider/profile_provi.dart';
import 'Services_adress.dart';
import 'edit_profile_pro.dart';

class ProfilePro extends StatelessWidget {
  ProfilePro({super.key});

  final controller = Get.put(ProviderController());

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Profile',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
      // ---------------- BODY ----------------
      body: Column(
        children: [
          SizedBox(
            height: 190,
            child: Stack(
              alignment: Alignment.center,
              children: [

                // ---------------- PROFILE DATA ----------------
                Obx(() {
                  final user = controller.currentProvider.value;

                  if (user == null) {
                    return const CircularProgressIndicator();
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // PROFILE IMAGE
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: getImage(user.image),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        user.person,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        user.email ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),

                // ---------------- EDIT BUTTON (TOP RIGHT) ----------------
                Positioned(
                  top: 20,
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => EditProfilePro());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Image.asset(
                        AppImages.profile_pen,
                        width: 18,
                        height: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.fieldcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomProfileButton(
                      text: 'My Service',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileProvi(),
                          ),
                        );
                      },
                      image: AppImages.catagories,
                    ),
                    Divider(color: AppColors.dividercolor, thickness: 2),

                    CustomProfileButton(
                      text: 'My Address',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HandymanList(),
                          ),
                        );
                      },
                      image: AppImages.user,
                    ),
                    Divider(color: AppColors.dividercolor, thickness: 2),
                    CustomProfileButton(
                      text: 'Service Address',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesAdress(),
                          ),
                        );
                      },
                      image: AppImages.location,
                    ),

                    Divider(color: AppColors.dividercolor, thickness: 2),

                    Divider(color: AppColors.dividercolor, thickness: 2),

                    CustomProfileButton(
                      text: 'Change Password',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HandyChangePassword(),
                          ),
                        );
                      },
                      image: AppImages.lock,
                    ),
                    Divider(color: AppColors.dividercolor, thickness: 2),
                    CustomProfileButton(
                      text: 'About',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HandyAbout(),
                          ),
                        );
                      },
                      image: AppImages.danger_circle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Log()),
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(
                color: AppColors.purple,
                fontSize:18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
  ImageProvider getImage(String img) {
    if (img.isEmpty) {
      return const AssetImage("assets/profile.png");
    }
    if (img.startsWith("http")) {
      return NetworkImage(img);
    }
    return FileImage(File(img));
  }
}