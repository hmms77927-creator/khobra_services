import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/app-colors.dart';
import '../../../Controller/auth_controller.dart';
import '../../../Models/user_model.dart';
import '../../Widgets/TextField/app-textfield.dart';

class AddDriverScreen extends StatelessWidget {
  AddDriverScreen({super.key});

  final controller = Get.find<DriverController>();

  final name = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final password = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.pickedImage.value.isEmpty
                        ? const AssetImage("assets/profile.png")
                        : FileImage(File(controller.pickedImage.value))
                    as ImageProvider,
                  ),
                );
              }),
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
                    controller: name,
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
                    controller: username,
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
                    controller: email,
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
                    controller: phone,
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
                    controller: city,
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
                    controller: password,
                    icon: Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    final driver = DriverModel(
                      id: "",
                      name: name.text,
                      username: username.text,
                      email: email.text,
                      phone: phone.text,
                      city: city.text,
                      password: password.text,
                      image: controller.pickedImage.value,
                    );
                    controller.addDriver(driver);
                    Get.back();
                  },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Save Driver"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}