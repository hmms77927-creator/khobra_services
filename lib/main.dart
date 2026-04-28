import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/View/Booking/booking_1.dart';
import 'package:flutter_application_newproject/View/Clock/select_time.dart';
import 'package:flutter_application_newproject/View/Dental-Office/dental_office_fillup.dart';
import 'package:flutter_application_newproject/View/Dental-Office/dental_office_form.dart';
import 'package:flutter_application_newproject/View/Home/dashboard.dart';
import 'package:flutter_application_newproject/View/Home/home.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/createnew_Password.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/verify_account.dart';
import 'package:flutter_application_newproject/View/Login-Screen/login-screen.dart';
import 'package:flutter_application_newproject/View/Login-Screen/register_screen.dart';
import 'package:flutter_application_newproject/View/Notifications/notifications_1.dart';
import 'package:flutter_application_newproject/View/Onboarding/OnboardingScreen/onboarding-screen.dart';
import 'package:flutter_application_newproject/View/Post%20a%20job/date.dart';
import 'package:flutter_application_newproject/View/Post%20a%20job/requestEmployee.dart';
import 'package:flutter_application_newproject/View/Post%20a%20job/rewie_screen.dart';
import 'package:flutter_application_newproject/View/Profile/about_us.dart';
import 'package:flutter_application_newproject/View/Profile/profile.dart';
import 'package:flutter_application_newproject/View/Profile/profile_history.dart';
import 'package:flutter_application_newproject/View/Profile/service_detail.dart';
import 'package:flutter_application_newproject/View/Profile/terms_condition.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/book_list.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/book_notification.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/book_services.dart';
import 'package:flutter_application_newproject/View/Provider_side/Booking/booking_com.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/add_handyman.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/assign_handyman_screen.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handy_about.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handy_change_password.dart';
import 'package:flutter_application_newproject/View/Provider_side/Handyman/handyman_list.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/Home_notification/home_notification.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/add_services.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_provi.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_rewive.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_services_detail.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_Provider/profile_provi.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/Services_adress.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/edit_profile_pro.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/edit_services_add.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/profile_pro.dart';
import 'package:flutter_application_newproject/View/Provider_side/Services/about.dart';
import 'package:flutter_application_newproject/View/Provider_side/Services/earning_list.dart';
import 'package:flutter_application_newproject/View/Provider_side/Services/my_services.dart';
import 'package:flutter_application_newproject/View/Provider_side/Services/terms.dart';
import 'package:flutter_application_newproject/View/Provider_side/Splash/splash_2.dart';
import 'package:flutter_application_newproject/View/SplashScreen/splash-view.dart';
import 'package:flutter_application_newproject/View/Widgets/Bottom-NavigationBar/Bottombar.dart';
import 'package:flutter_application_newproject/View/Widgets/Bottom-NavigationBar/bottom_provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Data/Local/shared_pref.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Splash2(),
      // home:  EditProfilePro(),
    );
  }
}
