import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Card/card.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {

  final data = Get.arguments ?? {};

  Widget buildImage(String img) {
    if (img.isEmpty) {
      return Image.asset(AppImages.home1, fit: BoxFit.cover);
    }

    if (img.startsWith("http")) {
      return Image.network(img, fit: BoxFit.cover);
    }

    if (img.startsWith("/")) {
      return Image.file(File(img), fit: BoxFit.cover);
    }
    return Image.asset(AppImages.home1, fit: BoxFit.cover);
  }
  @override
  Widget build(BuildContext context) {
    final image = data["image"] ?? "";
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 39.0),
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildImage(image),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DashboardCard(
                text: data["text"] ?? "",
                subtitle: data["subtitle"] ?? "",
                title: data["title"] ?? "",
                description: data["description"] ?? "",
                subdescription: data["subdescription"] ?? "",
                onPressed: () {},
                onTap: () {},
                doubleTap: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
