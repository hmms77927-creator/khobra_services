import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class HandyChangePassword extends StatefulWidget {
  const HandyChangePassword({super.key});

  @override
  State<HandyChangePassword> createState() => _HandyChangePasswordState();
}

class _HandyChangePasswordState extends State<HandyChangePassword> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Change Password',
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
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
              child: subcontainer(
                text:
                    'Your new password must be different from\n previous used password',
                color: AppColors.fullgrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Center(
                child: SizedBox(
                  width: 335,
                  height: 48,
                  child: Profileprofield(
                    text: '.......',
                    label: 'New Password',
                    controller: passwordcontroller,
                    icon: Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: subcontainer(
                text: 'Must be atleast 8 characters',
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Center(
                child: SizedBox(
                  width: 335,
                  height: 48,
                  child: Profileprofield(
                    text: 'Re-enter Password',
                    label: 'Re-enter Password',
                    controller: repasswordcontroller,
                    icon: Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: subcontainer(
                text: 'Both password must match',
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Center(
                child: SizedBox(
                  width: 335,
                  height: 45,
                  child: Bookbutton(text: 'Confirm', onPressed: () {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
