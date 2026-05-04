import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Data/Local/shared_pref.dart';
import '../Widgets/App-Card/card.dart';
import '../Provider_side/Booking/book_services.dart';

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
    for (var item in bookings) {
      item["qty"] ??= 1;
    }

    setState(() {});
  }

  void saveData() async {
    List<String> list =
    bookings.map((e) => jsonEncode(e)).toList();

    await SharedPref.prefs?.setStringList("bookings", list);
  }
  void increaseQty(int index) {
    int qty =
        int.tryParse(bookings[index]["qty"].toString()) ?? 1;
    bookings[index]["qty"] = qty + 1;
    saveData();
    setState(() {});
  }
  void decreaseQty(int index) {
    int qty =
        int.tryParse(bookings[index]["qty"].toString()) ?? 1;

    if (qty > 1) {
      bookings[index]["qty"] = qty - 1;
    } else {
      bookings.removeAt(index);
    }
    saveData();
    setState(() {});
  }
  double get totalPrice {
    return bookings.fold(0, (sum, item) {
      int qty =
          int.tryParse(item["qty"].toString()) ?? 1;
      double price =
          double.tryParse(item["price"].toString()) ?? 0;

      return sum + (price * qty);
    });
  }
  int get totalQuantity {
    return bookings.fold(0, (sum, item) {
      int qty =
          int.tryParse(item["qty"].toString()) ?? 1;
      return sum + qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Booking"),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: Text(
                "Qty: $totalQuantity",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Items: ${bookings.length}"),
                Text(
                  "Total: Rs ${totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final item = bookings[index];
                String time =
                    "${item["hours"] ?? ""}h ${item["minutes"] ?? ""}m";
                int qty =
                    int.tryParse(item["qty"].toString()) ?? 1;
                return Stack(
                  children: [
                    BookindCard(
                      text: item["serviceName"] ?? "",
                      title: "Price: ${item["price"]}",
                      subtitle: "Time:",
                      descrption: time,
                      image: item["image"] ?? "",
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  decreaseQty(index),
                              icon: const Icon(Icons.remove,
                                  size: 18),
                            ),
                            Text("$qty"),
                            IconButton(
                              onPressed: () =>
                                  increaseQty(index),
                              icon: const Icon(Icons.add,
                                  size: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingServices(
                        bookings: bookings,
                      ),
                    ),
                  );
                },
                child: const Text("Proceed"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
