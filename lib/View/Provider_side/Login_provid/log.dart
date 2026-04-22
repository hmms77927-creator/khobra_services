import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/forgot.dart';
import 'package:flutter_application_newproject/View/Provider_side/Login_provid/register.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:flutter_application_newproject/View_Model/auth_viewmodel.dart';

import '../../Widgets/Bottom-NavigationBar/bottom_provider.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final AuthViewModel vm = AuthViewModel();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isChecked = true;
  bool isLoading = false;

  // 🔥 LOGIN FUNCTION
  void login() async {
    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please accept Terms & Conditions")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final user = await vm.login(
      emailcontroller.text.trim(),
      passwordcontroller.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomProvider()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed")),
      );
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
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
              'We Say Hello!',
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

            const SizedBox(height: 20),

            AppTextfield(
              controller: passwordcontroller,
              hintText: 'Password',
              borderside: AppColors.lightwhite,
              bordercolor: AppColors.lightwhite,
            ),

            const SizedBox(height: 30),

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

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                text:  'Sign In',
                backgroundColor: AppColors.purple,
                iconColor: AppColors.purple, onPressed:login,
                // onPressed: isLoading ? null : loginScreen,
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerRight,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            AppTextButton(
              text: 'Create new account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
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
