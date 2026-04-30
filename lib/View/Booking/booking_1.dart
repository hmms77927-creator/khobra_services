// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import '../../Constant/app-colors.dart';
// import '../../Constant/app-images.dart';
// import '../../Controller/auth_controller.dart';
// import '../../Data/Local/shared_pref.dart';
// import '../Provider_side/Booking/book_services.dart';
// import '../Widgets/App-Card/card.dart';
//
// class Booking1 extends StatefulWidget {
//   const Booking1({super.key,  });
//
//   @override
//   State<Booking1> createState() => _Booking1State();
// }
//
// class _Booking1State extends State<Booking1> {
//   final controller = Get.find<BookingController>();
//
//   List<Map> bookings = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
//   void loadData() {
//     bookings = SharedPref.getBookings();
//     setState(() {});
//   }
//   void deleteSingle(int index) async {
//     bookings.removeAt(index);
//
//     List<String> list =
//     bookings.map((e) => jsonEncode(e)).toList();
//
//     await SharedPref.prefs?.setStringList("bookings", list);
//
//     setState(() {});
//   }
//   void clearAll() async {
//     await SharedPref.clearBookings();
//     bookings.clear();
//     setState(() {});
//   }
//   void showCancelDialog(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Image.asset(AppImages.dialog_booking),
//               const SizedBox(height: 12),
//               const Text(
//                 'Cancel Booking',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Are you sure you want to cancel?',
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey,
//                       ),
//                       onPressed: () {
//                         // final item = list[index];
//                         // Get.to(() => Booking1(item: item));
//                         Navigator.pop(context);
//
//                       },
//                       child: const Text("Cancel"),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                         deleteSingle(index);
//                       },
//                       child: const Text("Confirm"),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         title: Text('Booking', style: TextStyle(color: AppColors.pureblack)),
//         centerTitle: true,
//         backgroundColor: AppColors.white,
//         automaticallyImplyLeading: false,
//       ),
//       body: bookings.isEmpty
//           ? const Center(child: Text("No Booking Found"))
//           : ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final item = bookings[index];
//           String time =
//               "${item["hours"] ?? ""}h ${item["minutes"] ?? ""}m";
//           return BookindCard(
//             text: item["serviceName"] ?? "",
//             title: "Price: ${item["price"]}",
//             subtitle: "Time:",
//             descrption: time,
//             image: item["image"] ?? "",
//             onPressed: () {
//               showCancelDialog(index);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

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