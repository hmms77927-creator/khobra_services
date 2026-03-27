import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Dental-Office/dental_office_form.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({super.key});

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {
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
          HeaderContainer(text: 'Create New Password'),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: ForgotText(
              text: 'Please enter and confirm your new password.',
              title: 'You will need to login after you reset.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
            child: Align(
              alignment: .topLeft,
              child: textfieldheading(
                text: 'Password',
                color: AppColors.lightblue,
              ),
            ),
          ),
          AppTextfield(
            hintText: '*********',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Align(
              alignment: .topLeft,
              child: textfieldheading(
                text: 'must contain 8 char.',
                color: AppColors.purple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
            child: Align(
              alignment: .topLeft,
              child: textfieldheading(
                text: 'Confirm Password',
                color: AppColors.lightblue,
              ),
            ),
          ),
          AppTextfield(
            hintText: '*********',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: CustomButton(
              text: 'Create New Password',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DentalOfficeForm()),
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
