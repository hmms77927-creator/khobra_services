import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:get/get.dart';

import '../../../Controller/auth_controller.dart';
import '../../Widgets/TextField/app-textfield.dart';
import 'book_services.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  TextEditingController searchcontroller = TextEditingController();
  final controller = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
    controller.fetchServices();
  }
  Widget buildImage(String image) {
    if (image.isEmpty) {
      return Image.asset(
        "assets/profile.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
      );
    }

    if (image.startsWith("http")) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    }

    if (image.startsWith("/")) {
      return Image.file(
        File(image),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 180,
        errorBuilder: (_, __, ___) =>
            Image.asset("assets/profile.png"),
      );
    }

    return Image.asset(
      "assets/profile.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: 180,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.purple,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        final list = controller.serviceList;

        if (list.isEmpty) {
          return const Center(child: Text("No Services Found"));
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: bookfield(
                  controller: searchcontroller,
                  text: 'Pending',
                  onPressed: () {
                    final item = list[index];

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingServices(item: item,)),
                    );
                  },
                ),
              );
            }
            final item = list[index];
            return Card(
              color: AppColors.white,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: 0.5,color: AppColors.lightBlack),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: buildImage(item["image"] ?? ""),
                    ),
                  ),
                  CustomBookcontainer(
                    text: item["serviceName"] ?? "",
                    subtext: item["category"] ?? "",
                    title: item["address"] ?? "",
                    subtitle:
                    "${item["hours"] ?? ''} ${item["minutes"] ?? ''}",
                    description:
                    "Status: ${item["status"] ?? "Start"}",
                    onPressed: () {},
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}