import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Home/home_provi.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/forgot.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/register.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Bottom-NavigationBar/bottom_provider.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        automaticallyImplyActions: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                'We Say Hello!',
                style: TextStyle(
                  color: Color(0xFF941578),
                  fontSize: 32,
                  fontWeight: .w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: AppTextfield(
                hintText: 'Email',
                borderside: AppColors.purple,
                bordercolor: AppColors.purple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: AppTextfield(
                hintText: 'Password',
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  AgreeCircleButton(
                    isChecked: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  CustomContainer(
                    title: 'Agree to Terms & Conditions',
                    color: AppColors.lightBlack,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CustomButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomProvider()),
                  );
                },
                backgroundColor: AppColors.purple,
                iconColor: AppColors.purple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 30),
              child: Align(
                alignment: .bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgot()),
                    );
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 13,
                      fontWeight: .w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: AppTextButton(
                text: 'Create new account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                borderRadius: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
