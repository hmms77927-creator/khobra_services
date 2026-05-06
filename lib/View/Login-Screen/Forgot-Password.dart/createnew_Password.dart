// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_newproject/Constant/app-colors.dart';
// import 'package:flutter_application_newproject/View/Dental-Office/dental_office_form.dart';
// import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
// import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
// import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
//
// class CreatenewPassword extends StatefulWidget {
//   const CreatenewPassword({super.key});
//
//   @override
//   State<CreatenewPassword> createState() => _CreatenewPasswordState();
// }
//
// class _CreatenewPasswordState extends State<CreatenewPassword> {
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
//           HeaderContainer(text: 'Create New Password'),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0),
//             child: ForgotText(
//               text: 'Please enter and confirm your new password.',
//               title: 'You will need to login after you reset.',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
//             child: Align(
//               alignment: .topLeft,
//               child: textfieldheading(
//                 text: 'Password',
//                 color: AppColors.lightblue,
//               ),
//             ),
//           ),
//           AppTextfield(
//             hintText: '*********',
//             borderside: AppColors.lightwhite,
//             bordercolor: AppColors.lightwhite,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 15),
//             child: Align(
//               alignment: .topLeft,
//               child: textfieldheading(
//                 text: 'must contain 8 char.',
//                 color: AppColors.purple,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
//             child: Align(
//               alignment: .topLeft,
//               child: textfieldheading(
//                 text: 'Confirm Password',
//                 color: AppColors.lightblue,
//               ),
//             ),
//           ),
//           AppTextfield(
//             hintText: '*********',
//             borderside: AppColors.lightwhite,
//             bordercolor: AppColors.lightwhite,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 70.0),
//             child: CustomButton(
//               text: 'Create New Password',
//               onPressed: () async{
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => DentalOfficeForm()),
//                 // );
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
//




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatefulWidget {
  final String uid;

  const CreateNewPassword({super.key, required this.uid});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void savePassword() async {
    if (passwordController.text.trim() !=
        confirmController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password not match")),
      );
      return;
    }

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .set({
      "password": passwordController.text.trim(),
      "updatedAt": DateTime.now(),
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Password Updated ✔"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration:
              const InputDecoration(hintText: "New Password"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Confirm Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: savePassword,
              child: const Text("Save Password"),
            ),
          ],
        ),
      ),
    );
  }
}