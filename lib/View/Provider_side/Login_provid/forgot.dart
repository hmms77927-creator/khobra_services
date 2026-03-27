import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/verify.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: LeadButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          HeaderContainer(text: 'Forgot Password'),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ForgotText(
              text: 'No worries! Enter your email address below and ',
              title: 'we will send you a code to reset password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
            child: Align(
              alignment: .topLeft,
              child: TextfieldText(text: 'E-mail', color: AppColors.purple),
            ),
          ),
          AppTextfield(
            hintText: 'Enter your email',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
            child: CustomButton(
              text: 'Send Reset Instruction',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Verify()),
                );
              },
              backgroundColor: AppColors.purple,
              iconColor: AppColors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
