import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handy_about.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handy_change_password.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handyman_list.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/log.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_Provider/profile_provi.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/Services_adress.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/edit_profile_pro.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class ProfilePro extends StatefulWidget {
  const ProfilePro({super.key});

  @override
  State<ProfilePro> createState() => _ProfileProState();
}

class _ProfileProState extends State<ProfilePro> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppImages.profile_pro),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: const CircleBorder(),
                      side: BorderSide(color: AppColors.white, width: 3),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePro(),
                        ),
                      );
                    },
                    icon: Image.asset(AppImages.profile_pen),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ProviderProfile(text: 'Fiza Fatima ', subtext: 'fiza@provider.com'),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
