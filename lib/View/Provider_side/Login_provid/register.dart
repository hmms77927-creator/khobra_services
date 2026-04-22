import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/log.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:flutter_application_newproject/View_Model/auth_viewmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../Widgets/Bottom-NavigationBar/bottom_provider.dart';
import '../Home/home_provi.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password1controller = TextEditingController();
  TextEditingController password2controller = TextEditingController();

  final AuthViewModel vm = AuthViewModel();

  bool isChecked = false;

  void signup() async {
    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept terms & conditions")),
      );
      return;
    }

    if (password1controller.text.trim() !=
        password2controller.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }
Get.to( BottomProvider());
    try {
      final user = await vm.signup(
        emailcontroller.text.trim(),
        password1controller.text.trim(),
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account Created Successfully")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    password1controller.dispose();
    password2controller.dispose();
    super.dispose();
  }

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
            const SizedBox(height: 20),

            Text(
              'Create Account',
              style: TextStyle(
                color: const Color(0xFF941578),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 35),

            AppTextfield(
              controller: emailcontroller,
              hintText: 'Email',
              borderside: AppColors.purple,
              bordercolor: AppColors.purple,
            ),

            const SizedBox(height: 15),

            AppTextfield(
              controller: password1controller,
              hintText: 'Password',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),

            const SizedBox(height: 15),

            AppTextfield(
              controller: password2controller,
              hintText: 'Confirm Password',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AgreeCircleButton(
                  isChecked: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                CustomContainer(
                  title: 'Agree to Terms & Conditions',
                  color: AppColors.lightBlack,
                ),
              ],
            ),

            const SizedBox(height: 35),

            CustomButton(
              text: 'Sign up',
              backgroundColor: AppColors.purple,
              iconColor: AppColors.purple,
              onPressed: signup,
            ),

            const SizedBox(height: 90),

            AppTextButton(
              text: 'Already have an account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Log()),
                );
              },
              borderRadius: 9,
            ),
          ],
        ),
      ),
    );
  }
}
