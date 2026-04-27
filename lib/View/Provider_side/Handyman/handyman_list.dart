import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:get/get.dart';

import '../../../Constant/app-colors.dart';
import '../../../Controller/auth_controller.dart';
import 'add_handyman.dart';

class HandymanList extends StatefulWidget {
  const HandymanList({super.key});

  @override
  State<HandymanList> createState() => _HandymanListState();
}

class _HandymanListState extends State<HandymanList> {
  final controller = Get.put(DriverController());

  @override
  void initState() {
    super.initState();
    controller.fetchDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => const AddDriverScreen()),
          ),
        ],
      ),
      body: Obx(() {
        final list = controller.driverList;
        if (list.isEmpty) {
          return const Center(child: Text("No Drivers Found"));
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final driver = list[index];
            return handymancard(
              text: driver.name,
              subtext: driver.email,
              title: 'Behria Town Lahore',
              subtitle: driver.phone,
              color: AppColors.fullgrey,
              textcolor: AppColors.black,
              image: driver.image,
              buttontext: 'Deactivate',
              subbuttontext: 'Activate',
              onPressed: () {
                Get.to(() => const AddDriverScreen());
              },
              onTap: () {},
            );
          },
        );
      }),
    );
  }
}