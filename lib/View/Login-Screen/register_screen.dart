import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Login-Screen/login-screen.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Bottom-NavigationBar/Bottombar.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:flutter_application_newproject/View_Model/auth_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = true;

  final AuthViewModel vm = AuthViewModel();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password1controller = TextEditingController();
  TextEditingController password2controller = TextEditingController();

  bool isLoading = false;
  void signup() async {
    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please accept Terms & Conditions")),
      );
      return;
    }

    if (password1controller.text != password2controller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final user = await vm.signup(
      emailcontroller.text.trim(),
      password1controller.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom1()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Failed")),
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFF941578),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 35),
              AppTextfield(
                controller: emailcontroller,
                hintText: 'Email',
                borderside: AppColors.purple,
                bordercolor: AppColors.purple,
              ),
              SizedBox(height: 15),
              AppTextfield(
                controller: password1controller,
                hintText: 'Password',
                obscureText: true,
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),
              SizedBox(height: 15),
              AppTextfield(
                controller: password2controller,
                hintText: 'Confirm Password',
                obscureText: true,
                borderside: AppColors.lightwhite,
                bordercolor: AppColors.lightwhite,
              ),
              SizedBox(height: 15),
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

              SizedBox(height: 35),

              // 🔹 Button
              isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                text: 'Sign up',
                onPressed: signup,
                backgroundColor: AppColors.purple,
                iconColor: AppColors.purple,
              ),
              SizedBox(height: 60),
              AppTextButton(
                text: 'Already have an account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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