import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/log.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                'Create Account',
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
              padding: const EdgeInsets.only(top: 15.0),
              child: AppTextfield(
                hintText: 'Password',
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: AppTextfield(
                hintText: 'Confirm Password',
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomContainer(
                      title: 'Agree to Terms & Conditions',
                      color: AppColors.lightBlack,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: CustomButton(
                text: 'Sign up',
                onPressed: () {},
                backgroundColor: AppColors.purple,
                iconColor: AppColors.purple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: AppTextButton(
                text: 'Already have an account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Log()),
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
