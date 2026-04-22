// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/createnew_Password.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
//
// class VerifyAccount extends StatefulWidget {
//   String verificationid;
//   const VerifyAccount({super.key,  required this.verificationid});
//
//   @override
//   State<VerifyAccount> createState() => _VerifyAccountState();
// }
//
// class _VerifyAccountState extends State<VerifyAccount> {
//
//   TextEditingController phonecontroller =TextEditingController();
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
//       body: Column(
//         children: [
//           HeaderContainer(text: 'Verify Account'),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: ForgotText(
//               text: 'Code has been send to iqra@gmail.com. ',
//               title: 'Enter the code to verify your account.',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
//             child: Align(
//               alignment: .topLeft,
//               child: TextfieldText(text: 'Enter Code', color: AppColors.purple),
//             ),
//           ),
//           AppTextfield(
//             controller: phonecontroller,
//             hintText: 'Enter Code',
//             borderside: AppColors.lightwhite,
//             bordercolor: AppColors.lightwhite,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, left: 80, right: 120),
//             child: ResendContainer(
//               text: 'Didn’t Receive Code?',
//               color: AppColors.neutral,
//               title: 'Resend Code',
//               subtitle: 'Resend code in 00:59',
//               titlecolor: AppColors.purple,
//               subtitlecolor: AppColors.neutral,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 70.0),
//             child: CustomButton(
//               text: 'Verify Account',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CreatenewPassword()),
//                 );
//               },
//               backgroundColor: AppColors.purple,
//               iconColor: AppColors.purple,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/createnew_Password.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
//
// class VerifyAccount extends StatefulWidget {
//   final String verificationid;
//
//   const VerifyAccount({super.key, required this.verificationid});
//
//   @override
//   State<VerifyAccount> createState() => _VerifyAccountState();
// }
//
// class _VerifyAccountState extends State<VerifyAccount> {
//   TextEditingController phonecontroller = TextEditingController();
//
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
//       body: Column(
//         children: [
//           HeaderContainer(text: 'Verify Account'),
//
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: ForgotText(
//               text: 'Code has been send to iqra@gmail.com. ',
//               title: 'Enter the code to verify your account.',
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: TextfieldText(
//                 text: 'Enter Code',
//                 color: AppColors.purple,
//               ),
//             ),
//           ),
//
//           AppTextfield(
//             controller: phonecontroller,
//             hintText: 'Enter Code',
//             borderside: AppColors.lightwhite,
//             bordercolor: AppColors.lightwhite,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, left: 80, right: 70),
//             child: ResendContainer(
//               text: 'Didn’t Receive Code?',
//               color: AppColors.neutral,
//               title: 'Resend Code',
//               subtitle: 'Resend code in 00:59',
//               titlecolor: AppColors.purple,
//               subtitlecolor: AppColors.neutral,
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(top: 70.0),
//             child: CustomButton(
//               text: 'Verify Account',
//               backgroundColor: AppColors.purple,
//               iconColor: AppColors.purple,
//
//               onPressed: () async {
//                 try {
//                   PhoneAuthCredential credential =
//                   PhoneAuthProvider.credential(
//                     verificationId: widget.verificationid,
//                     smsCode: phonecontroller.text.trim(),
//                   );
//
//                   await FirebaseAuth.instance
//                       .signInWithCredential(credential);
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CreatenewPassword(),
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("Invalid OTP Code"),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/createnew_Password.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class VerifyAccount extends StatefulWidget {
  final String verificationid;

  const VerifyAccount({super.key, required this.verificationid});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: LeadButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          HeaderContainer(text: 'Verify Account'),

          const SizedBox(height: 20),

          AppTextfield(
            controller: otpController,
            hintText: 'Enter OTP',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),

          const SizedBox(height: 100),

          CustomButton(
            text: 'Verify OTP',
            backgroundColor: AppColors.purple,
            iconColor: AppColors.purple,
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                PhoneAuthProvider.credential(
                  verificationId: widget.verificationid,
                  smsCode: otpController.text.trim(),
                );

                await FirebaseAuth.instance
                    .signInWithCredential(credential);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatenewPassword(),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid OTP")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
