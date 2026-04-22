import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Login-Screen/login-screen.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/log.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart'
    hide CustomIntroButton;

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: IntroScreen(
                title: 'Give Services and earn Money !',
                substitle: 'Please Login As...',
              ),
            ),
            Container(child: Center(child: Image.asset(AppImages.splash_1))),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
              child: SizedBox(
                width: 350,
                height: 72,
                child: CustomintroButton(
                  text: 'As a Driver',

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  image: AppImages.intro_1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
              child: SizedBox(
                width: 350,
                height: 72,
                child: CustomintroButton(
                  text: 'As a Provider',

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Log()),
                    );
                  },
                  image: AppImages.intro_2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
