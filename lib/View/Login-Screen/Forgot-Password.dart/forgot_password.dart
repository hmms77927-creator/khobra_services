// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/verify_account.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   TextEditingController phonecontroller =TextEditingController();
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
//                 child: TextfieldText(text: 'E-mail', color: AppColors.purple),
//               ),
//             ),
//             AppTextfield(
//         controller: phonecontroller,
//               hintText: 'Enter your email',
//               borderside: AppColors.lightwhite,
//               bordercolor: AppColors.lightwhite,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 150.0, left: 10,),
//               child: CustomButton(
//                 text: 'Send Reset Instruction',
//                 onPressed:  ()async {
//                   await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential crediental){}, verificationFailed: (FirebaseAuthException ex){}, codeSent: (String verficationid,int? resendtoken){}, codeAutoRetrievalTimeout:(String verificationId){},phoneNumber: phonecontroller.text.toString());
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => VerifyAccount(verificationid: 'verificationId',)),
//                   );
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


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Login-Screen/Forgot-Password.dart/verify_account.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();

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
          HeaderContainer(text: 'Forgot Password'),

          const SizedBox(height: 10),

          ForgotText(
            text: 'Enter your phone number',
            title: 'We will send OTP for verification',
          ),

          const SizedBox(height: 20),

          AppTextfield(
            controller: phoneController,
            hintText: '+92xxxxxxxxxx',
            borderside: AppColors.lightwhite,
            bordercolor: AppColors.lightwhite,
          ),

          const SizedBox(height: 120),

          CustomButton(
            text: 'Send OTP',
            backgroundColor: AppColors.purple,
            iconColor: AppColors.purple,
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: phoneController.text.trim(),

                verificationCompleted: (cred) {},

                verificationFailed: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message.toString())),
                  );
                },

                codeSent: (String verificationId, int? resendToken) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyAccount(
                        verificationid: verificationId,
                      ),
                    ),
                  );
                },

                codeAutoRetrievalTimeout: (verificationId) {},
              );
            },
          ),
        ],
      ),
    );
  }
}