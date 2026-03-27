import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';

class EditProfilePro extends StatefulWidget {
  const EditProfilePro({super.key});

  @override
  State<EditProfilePro> createState() => _EditProfileProState();
}

class _EditProfileProState extends State<EditProfilePro> {
  TextEditingController personcontroller = TextEditingController();
  TextEditingController person1controller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
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
            'Edit Profile',
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
            icon: Icon(Icons.check, color: AppColors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppImages.profile_pro),
                ),

                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: const CircleBorder(),
                      side: BorderSide(color: AppColors.white, width: 3),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.camera, color: AppColors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  text: 'Password',
                  label: 'Password',
                  controller: passwordcontroller,
                  icon: Icons.visibility_off,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 48,
                    width: 157,
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
                    width: 157,
                    child: Profileprofield(
                      text: 'State',
                      label: 'State',
                      controller: statecontroller,
                      icon: Icons.keyboard_arrow_down,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 48,
                width: 335,
                child: Profileprofield(
                  text: 'Country',
                  label: 'Country',
                  controller: countrycontroller,
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
                  text: 'Address',
                  label: 'Address',
                  controller: addresscontroller,
                  icon: Icons.location_on,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 157,
                    height: 48,
                    child: TextButton(
                      onPressed: () {},
                      child: head2cont(
                        text: 'Verify ID',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 157,
                    height: 48,
                    child: Bookbutton(text: 'Save', onPressed: () {}),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
