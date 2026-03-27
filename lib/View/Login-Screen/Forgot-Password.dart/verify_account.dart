import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/createnew_Password.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: LeadButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          HeaderContainer(text: 'Verify Account'),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ForgotText(
              text: 'Code has been send to iqra@gmail.com. ',
              title: 'Enter the code to verify your account.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
            child: Align(
              alignment: .topLeft,
              child: TextfieldText(text: 'Enter Code', color: AppColors.purple),
            ),
          ),
          AppTextfield(
            hintText: 'Enter Code',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 80, right: 120),
            child: ResendContainer(
              text: 'Didn’t Receive Code?',
              color: AppColors.neutral,
              title: 'Resend Code',
              subtitle: 'Resend code in 00:59',
              titlecolor: AppColors.purple,
              subtitlecolor: AppColors.neutral,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: CustomButton(
              text: 'Verify Account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatenewPassword()),
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
