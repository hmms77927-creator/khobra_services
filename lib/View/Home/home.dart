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
  final controller = Get.put(Service2Controller());

  void saveBooking(Map item) {
    SharedPref.saveBooking(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, IQRA',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Text(
              'What would you like to search?',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),

      body: Obx(() {
        final list = controller.filteredList;

        // 🔥 SAFE LOADING CHECK (IMPORTANT FIX)
        if (controller.serviceList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (list.isEmpty) {
          return const Center(
            child: Text("No services found"),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: list.length + 1,
          itemBuilder: (context, index) {

            // 🔍 SEARCH FIELD
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: HomeField(
                  hintText: 'Search for..',
                  onChanged: (value) {
                    controller.filterServices(value);
                  },
                  onPressed: () {},
                ),
              );
            }

            final item = list[index - 1];

            return HomeCard(
              image: item["image"] ?? "",
              text: item["serviceName"] ?? "",
              subtext:
              "${item["hours"] ?? 0}h ${item["minutes"] ?? 0}m",
              title: item["price"] ?? "",
              subtitle: "Rating",
              description: "Duration",
              subdescription:
              "${item["hours"] ?? 0}h ${item["minutes"] ?? 0}m",

              onPressed: () {
                saveBooking(item);
                Get.to(() => const Booking1());
              },

              onTap: () {
                Get.to(Dashboard(), arguments: {
                  "image": item["image"] ?? "",
                  "text": item["serviceName"] ?? "",
                  "subtext":
                  "${item["hours"] ?? 0}h ${item["minutes"] ?? 0}m",
                  "title": item["price"] ?? "",
                });
              },
              ontap: () {
                Get.to(HomeRewive(
                  serviceId: item["id"],
                  serviceName: item["serviceName"],
                  image: item["image"],
                ));
              },
            );
          },
        );
      }),
    );
  }
}