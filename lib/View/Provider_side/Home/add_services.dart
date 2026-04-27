import 'dart:io';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/app-colors.dart';
import '../../../Constant/app-images.dart';
import '../../../Controller/auth_controller.dart';
import '../../../View/Widgets/App-Buttons/custom-Buttons.dart';
import '../../../View/Widgets/TextField/app-textfield.dart';
import '../Booking/book_list.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  final controller = Get.put(ServiceController());

  final services1controller = TextEditingController();
  final services2controller = TextEditingController();
  final services3controller = TextEditingController();
  final services4controller = TextEditingController();
  final services5controller = TextEditingController();
  final services6controller = TextEditingController();
  final services7controller = TextEditingController();
  final services8controller = TextEditingController();
  final services9controller = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    services1controller.dispose();
    services2controller.dispose();
    services3controller.dispose();
    services4controller.dispose();
    services5controller.dispose();
    services6controller.dispose();
    services7controller.dispose();
    services8controller.dispose();
    services9controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const Text("Add Service"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🔥 IMAGE PICKER
            Obx(() => GestureDetector(
              onTap: controller.pickImage,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: DottedDecoration(
                    shape: Shape.box,
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.purple,
                  ),
                  child: controller.imagePath.value.isEmpty
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.image2),
                      const SizedBox(height: 5),
                      const Text("Choose Image"),
                    ],
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(controller.imagePath.value),
                      width: double.infinity,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.fieldcolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    addservicea(
                      text: 'Service Name',
                      label: 'Service Name',
                      controller: services1controller,
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const SizedBox(height: 10),
                    addservicea(
                      text: 'Category',
                      label: 'Category',
                      controller: services2controller,
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const SizedBox(height: 10),
                    addservicea(
                      text: 'Address',
                      label: 'Address',
                      controller: services3controller,
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: addservicea(
                            text: 'Type',
                            label: 'Type',
                            controller: services4controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: addservicea(
                            text: 'Status',
                            label: 'Status',
                            controller: services5controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: addservicea(
                            text: 'Price',
                            label: 'Price',
                            controller: services6controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: addservicea(
                            text: 'Discount',
                            label: 'Discount',
                            controller: services7controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: addservicea(
                            text: 'Hours',
                            label: 'Hours',
                            controller: services8controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: addservicea(
                            text: 'Minutes',
                            label: 'Minutes',
                            controller: services9controller,
                            icon: Icons.keyboard_arrow_down,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: AppColors.purple,
                          onChanged: (v) {
                            setState(() {
                              isChecked = v!;
                            });
                          },
                        ),
                        const Text("Set as Feature"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Bookbutton(
                  text: "Save",
                  onPressed: () async {
                    await controller.addService({
                      "image": controller.imagePath.value,
                      "serviceName": services1controller.text,
                      "category": services2controller.text,
                      "address": services3controller.text,
                      "type": services4controller.text,
                      "status": services5controller.text,
                      "price": services6controller.text,
                      "discount": services7controller.text,
                      "hours": services8controller.text,
                      "minutes": services9controller.text,
                      "isFeature": isChecked,
                    });
                    Get.to(const BookList());
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}