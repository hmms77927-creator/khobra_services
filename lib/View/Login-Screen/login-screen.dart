import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/forgot_password.dart';
import 'package:flutter_application_newproject/View/Login-Screen/register_screen.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Bottom-NavigationBar/Bottombar.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:flutter_application_newproject/View_Model/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthViewModel vm = AuthViewModel();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isChecked = true;
  bool isLoading = false;
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
        MaterialPageRoute(builder: (context) => Bottom1()),
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),

              // 🔹 Title
              Text(
                'We Say Hello!',
                style: TextStyle(
                  color: Color(0xFF941578),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 35),

              // 🔹 Email
              AppTextfield(
                controller: emailcontroller,
                hintText: 'Email',
                borderside: AppColors.purple,
                bordercolor: AppColors.purple,
              ),

              SizedBox(height: 20),

              // 🔹 Password
              AppTextfield(
                controller: passwordcontroller,
                obscureText: true,
                hintText: 'Password',
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),

              SizedBox(height: 25),

              // 🔹 Terms
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
                  SizedBox(width: 10),
                  CustomContainer(
                    title: 'Agree to Terms & Conditions',
                    color: AppColors.lightBlack,
                  ),
                ],
              ),

              SizedBox(height: 25),

              // 🔹 Login Button
              isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                text: 'Sign In',
                onPressed: login, // 🔥 CALL HERE
                backgroundColor: AppColors.purple,
                iconColor: AppColors.purple,
              ),

              SizedBox(height: 20),

              // 🔹 Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
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

              SizedBox(height: 60),

              // 🔹 Register
              AppTextButton(
                text: 'Create new account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                borderRadius: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
