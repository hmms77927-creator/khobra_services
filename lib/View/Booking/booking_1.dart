import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Constant/app-colors.dart';
import '../../Data/Local/shared_pref.dart';
import '../Provider_side/Booking/book_services.dart';
import '../Widgets/App-Card/card.dart';
import 'package:get/get.dart';

class Booking1 extends StatefulWidget {
  const Booking1({super.key});

  @override
  State<Booking1> createState() => _Booking1State();
}

class _Booking1State extends State<Booking1> {
  List<Map> bookings = [];

  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    bookings = SharedPref.getBookings();

    _calculateTotal();
    setState(() {});
  }

  /// 🔥 AUTO TOTAL CALCULATION
  void _calculateTotal() {
    totalPrice = 0;

    for (var item in bookings) {
      double price =
          double.tryParse(item["price"].toString()) ?? 0;

      int qty = item["quantity"] ?? 1;

      totalPrice += price * qty;
    }
  }

  /// ➕ ADD SAME ITEM → QUANTITY INCREASE
  void addItem(Map newItem) {
    int index = bookings.indexWhere(
            (e) => e["serviceName"] == newItem["serviceName"]);

    if (index != -1) {
      bookings[index]["quantity"] =
          (bookings[index]["quantity"] ?? 1) + 1;
    } else {
      newItem["quantity"] = 1;
      bookings.add(newItem);
    }

    SharedPref.prefs?.setStringList(
      "bookings",
      bookings.map((e) => jsonEncode(e)).toList(),
    );

    _calculateTotal();
    setState(() {});
  }

  /// ➖ DECREASE
  void decrease(int index) {
    if ((bookings[index]["quantity"] ?? 1) > 1) {
      bookings[index]["quantity"]--;
    } else {
      bookings.removeAt(index);
    }

    SharedPref.prefs?.setStringList(
      "bookings",
      bookings.map((e) => jsonEncode(e)).toList(),
    );

    _calculateTotal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: const Text("Booking"),
        backgroundColor: AppColors.white,
      ),

      body: bookings.isEmpty
          ? const Center(child: Text("No Booking Found"))
          : Column(
        children: [

          /// LIST
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final item = bookings[index];

                int qty = item["quantity"] ?? 1;
                double price =
                    double.tryParse(
                      item["price"].toString(),
                    ) ??
                        0;

                return BookindCard(
                  text: item["serviceName"] ?? "",
                  title:'',
                  // "Rs ${price} × $qty = ${price * qty}",
                  subtitle: "Time",
                  descrption:
                  "${item["hours"]}h ${item["minutes"]}m",
                  image: item["image"] ?? "",
                  onPressed: () {
                    decrease(index);
                        Get.to(() =>
                            BookingServices(item: item,));
                  },
                );
              },
            ),
          ),

          // / TOTAL BAR
          // Container(
          //   padding: const EdgeInsets.all(15),
          //   width: double.infinity,
          //   color: Colors.black12,
          //   child: Text(
          //     "Total: Rs ${totalPrice.toStringAsFixed(2)}",
          //     style: const TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
