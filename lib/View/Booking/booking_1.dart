import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Constant/app-colors.dart';
import '../../Constant/app-images.dart';
import '../../Data/Local/shared_pref.dart';
import '../Widgets/App-Card/card.dart';

class Booking1 extends StatefulWidget {
  const Booking1({super.key});

  @override
  State<Booking1> createState() => _Booking1State();
}

class _Booking1State extends State<Booking1> {
  List<Map> bookings = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    bookings = SharedPref.getBookings();
    setState(() {});
  }
  void deleteSingle(int index) async {
    bookings.removeAt(index);

    List<String> list =
    bookings.map((e) => jsonEncode(e)).toList();

    await SharedPref.prefs?.setStringList("bookings", list);

    setState(() {});
  }
  void clearAll() async {
    await SharedPref.clearBookings();
    bookings.clear();
    setState(() {});
  }
  void showCancelDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.dialog_booking),
              const SizedBox(height: 12),
              const Text(
                'Cancel Booking',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Are you sure you want to cancel?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        deleteSingle(index);
                      },
                      child: const Text("Confirm"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Booking', style: TextStyle(color: AppColors.pureblack)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
      ),
      body: bookings.isEmpty
          ? const Center(child: Text("No Booking Found"))
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final item = bookings[index];
          String time =
              "${item["hours"] ?? ""}h ${item["minutes"] ?? ""}m";
          return BookindCard(
            text: item["serviceName"] ?? "",
            title: "Price: ${item["price"]}",
            subtitle: "Time:",
            descrption: time,
            image: item["image"] ?? "",
            onPressed: () {
              showCancelDialog(index);
            },
          );
        },
      ),
    );
  }
}