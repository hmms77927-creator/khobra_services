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
//                 onPressed:  (){
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




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'verify_account.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   final phoneController = TextEditingController();
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   void sendOtp() async {
//     String phoneNumber = "+92${phoneController.text.trim()}";
//
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//
//       verificationCompleted: (cred) {},
//
//       verificationFailed: (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? "Error")),
//         );
//       },
//
//       codeSent: (verificationId, resendToken) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => VerifyAccount(
//               verificationId: verificationId,
//             ),
//           ),
//         );
//       },
//
//       codeAutoRetrievalTimeout: (verificationId) {},
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Forgot Password")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 hintText: "Enter phone number (3XXXXXXXXX)",
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: sendOtp,
//               child: const Text("Send OTP"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'verify_account.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;
  void sendOtp() async {
    setState(() => loading = true);

    try {
      String phone = phoneController.text.trim();

      // FORCE FORMAT
      if (!phone.startsWith("+")) {
        phone = "+92$phone";
      }

      print("Sending OTP to: $phone");

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,

        timeout: const Duration(seconds: 60),

        verificationCompleted: (cred) {
          print("Auto verified");
        },

        verificationFailed: (e) {
          setState(() => loading = false);
          print("ERROR: ${e.code}");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Error")),
          );
        },

        codeSent: (vid, token) {
          setState(() => loading = false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VerifyAccount(
                verificationId: vid,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (vid) {},
      );
    } catch (e) {
      setState(() => loading = false);
      print("CATCH ERROR: $e");
    }
  }
  // void sendOtp() async {
  //   setState(() => loading = true);
  //
  //   String phone = phoneController.text.trim();
  //
  //   // FIX: force correct format
  //   if (!phone.startsWith("+")) {
  //     phone = "+92$phone";
  //   }
  //
  //   try {
  //     await auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //
  //       timeout: const Duration(seconds: 60),
  //
  //       verificationCompleted: (cred) {
  //         print("Auto verified");
  //       },
  //
  //       verificationFailed: (e) {
  //         setState(() => loading = false);
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(e.message ?? "Verification failed")),
  //         );
  //       },
  //
  //       codeSent: (vid, token) {
  //         setState(() => loading = false);
  //
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (_) => VerifyAccount(
  //               verificationId: vid,
  //             ),
  //           ),
  //         );
  //       },
  //
  //       codeAutoRetrievalTimeout: (vid) {
  //         print("Timeout");
  //       },
  //     );
  //   } catch (e) {
  //     setState(() => loading = false);
  //     print("ERROR: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter phone (3XXXXXXXXX)",
              ),
            ),

            const SizedBox(height: 20),

            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: sendOtp,
              child: const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}