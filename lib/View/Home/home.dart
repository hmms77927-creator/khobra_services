import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/app-colors.dart';
import '../../Controller/auth_controller.dart';
import '../../Data/Local/shared_pref.dart';
import '../Booking/booking_1.dart';
import '../Provider_side/Home/home_rewive.dart';
import '../Widgets/App-Card/card.dart';
import '../Widgets/TextField/app-textfield.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(ServiceController());
  final serviceController = Get.put(ServiceController());
  final bookingController = Get.find<BookingController>();

  @override
  void initState() {
    super.initState();
    controller.fetchServices();
  }

  void saveBooking(Map item) {
    SharedPref.saveBooking(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        appBar: AppBar(
        backgroundColor: AppColors.white,
          automaticallyImplyLeading:false ,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, IQRA',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'What would you like to search?',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
//
      body: Obx(() {
        final list = controller.serviceList;
        if (list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: list.length,
          itemBuilder: (context, index) {

            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: HomeField(
                  hintText: 'Search for..',
                  onPressed: () {},
                ),
              );
            }
            final item = list[index];
            return HomeCard(
              image: item["image"] ?? "",
              text: item["serviceName"] ?? "",
              subtext: "${item["hours"]}h ${item["minutes"]}m",
              title: item["price"] ?? "",
              subtitle: "Rating",
              description: "Duration",
              subdescription: "${item["hours"]}h ${item["minutes"]}m",
              onPressed: () {
Get.to(HomeRewive (

  serviceId: item["id"],
  serviceName: item["serviceName"],
  image: item["image"],));

                // saveBooking(item);
                // Get.to(() => Booking1());
              },
              onTap: () {
                Get.to(Dashboard(),arguments: {
                  "image": item["image"] ?? "",
                  "text": item["serviceName"] ?? "",
                  "subtext": "${item["hours"]}h ${item["minutes"]}m",
                  "title": item["price"] ?? "",
                });
              },
            );
          },
        );
      }),
    );
  }
}
