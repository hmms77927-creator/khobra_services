// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/verify_account.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
//
// import '../../../Controller/auth_controller.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   final controller = Get.put(Auth1Controller());
//   final phone = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         leading: LeadButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HeaderContainer(text: 'Forgot Password'),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: ForgotText(
//                 text: 'No worries! Enter your email address below and ',
//                 title: 'we will send you a code to reset password',
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
//               child: Align(
//                 alignment: .topLeft,
//                 child: TextfieldText(
//
//                     text: 'E-mail', color: AppColors.purple),
//               ),
//             ),
//             AppTextfield(
//         controller: phone,
//               hintText: 'Enter your email',
//               borderside: AppColors.lightwhite,
//               bordercolor: AppColors.lightwhite,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 150.0, left: 10,),
//               child: CustomButton(
//                 text: 'Send Reset Instruction',
//                 onPressed:  ()async {
//                   controller.sendOTP(phone.text);
//                 },
//                 backgroundColor: AppColors.purple,
//                 iconColor: AppColors.purple,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/app-colors.dart';
import '../../../Controller/auth_controller.dart';
import '../../Widgets/App-Buttons/custom-Buttons.dart';
import '../../Widgets/TextField/app-textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final controller = Get.put(Auth1Controller());
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Forgot Password",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          AppTextfield(
            controller: phone,
            hintText: "+92XXXXXXXXXX", borderside: AppColors.white, bordercolor: AppColors.white, 
          ),
          const Spacer(),
          CustomButton(
            text: "Send OTP",
            onPressed: () {
              controller.sendOTP(phone.text);
            },
            backgroundColor: AppColors.purple,
            iconColor: AppColors.purple,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}