import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Provider_side/Profile_provi/profile_pro.dart';
import 'package:flutter_application_newproject/View/Widgets/TextField/app-textfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Constant/app-images.dart';
import '../../../Controller/auth_controller.dart';

class EditProfilePro extends StatelessWidget {
  EditProfilePro({super.key});

  final controller = Get.put(ProviderController());

  final person = TextEditingController();
  final person1 = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final address = TextEditingController();

  final RxString imagePath = ''.obs;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imagePath.value = picked.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = controller.currentProvider.value;
    if (data != null && person.text.isEmpty) {
      person.text = data.person;
      person1.text = data.person1;
      email.text = data.email;
      password.text = data.password;
      phone.text = data.phonenumber;
      city.text = data.city;
      state.text = data.state;
      country.text = data.country;
      address.text = data.address;
      imagePath.value = data.image;
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 200,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Edit Profile',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔥 IMAGE PICKER (UI SAME)
            Stack(
              children: [
                Obx(() => CircleAvatar(
                  radius: 70,
                  backgroundImage: imagePath.value.isNotEmpty
                      ? FileImage(File(imagePath.value))
                      : AssetImage(AppImages.profile_pro) as ImageProvider,
                )),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: const CircleBorder(),
                      side: BorderSide(color: AppColors.white, width: 3),
                    ),
                    onPressed: pickImage,
                    icon: Icon(Icons.camera, color: AppColors.white),
                  ),
                ),
              ],
            ),

            /// 🔽 ALL FIELDS (UI SAME)

            _field('Full Name', person, Icons.person),
            _field('User Name', person1, Icons.person),
            _field('Email', email, Icons.email),
            _field('Password', password, Icons.visibility_off),
            _field('Phone Number', phone, Icons.phone),

            Row(
              children: [
                Expanded(child: _field('City', city, Icons.location_city)),
                SizedBox(width: 10),
                Expanded(child: _field('State', state, Icons.map)),
              ],
            ),

            _field('Country', country, Icons.flag),
            _field('Address', address, Icons.location_on),

            const SizedBox(height: 20),

            /// 🔥 SAVE BUTTON
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {

                await controller.addProvider(
                  person.text,
                  person1.text,
                  email.text,
                  password.text,
                  phone.text,
                  city.text,
                  state.text,
                  country.text,
                  address.text,
                  imagePath.value,
                );

                Get.off(() => ProfilePro());
              },
              child: const Text("Save"),
            )),
          ],
        ),
      ),
    );
  }

  /// 🔧 REUSABLE FIELD (UI SAME)
  Widget _field(String hint, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Profileprofield(
          text: hint,
          label: hint,
          controller: controller,
          icon: icon,
        ),
      ),
    );
  }
}
