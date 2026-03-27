import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class AddHandyman extends StatefulWidget {
  const AddHandyman({super.key});

  @override
  State<AddHandyman> createState() => _AddHandymanState();
}

class _AddHandymanState extends State<AddHandyman> {
  TextEditingController personcontroller = TextEditingController();
  TextEditingController person1controller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Add Drivers',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: AppColors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10.0,
              ),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'Full Name',
                  label: 'Name',
                  controller: personcontroller,
                  icon: Icons.person,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'User Name',
                  label: 'Name',
                  controller: person1controller,
                  icon: Icons.person,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'ashutosh@user.com',
                  label: 'Email',
                  controller: emailcontroller,
                  icon: Icons.email,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'Phone Number',
                  label: 'Phone',
                  controller: phonecontroller,
                  icon: Icons.phone_callback,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'City',
                  label: 'City',
                  controller: citycontroller,
                  icon: Icons.keyboard_arrow_down,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'Password',
                  label: 'Password',
                  controller: passwordcontroller,
                  icon: Icons.visibility_off,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
