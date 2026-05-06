import 'package:flutter/material.dart';
import '../../../Constant/app-colors.dart';
import '../../Widgets/App-Buttons/custom-Buttons.dart';
import '../../Widgets/Custom-Container/custom_container.dart';

class BookingServices extends StatefulWidget {
  final List<Map> bookings;

  const BookingServices({
    super.key,
    required this.bookings,
  });

  @override
  State<BookingServices> createState() => _BookingServicesState();
}

class _BookingServicesState extends State<BookingServices> {
  late List<Map> items;

  @override
  void initState() {
    super.initState();
    items = widget.bookings;

    /// ensure qty exists
    for (var e in items) {
      e["qty"] ??= 1;
    }
  }
  double get subtotal {
    return items.fold(0, (sum, item) {
      int qty = int.tryParse(item["qty"].toString()) ?? 1;
      double price = double.tryParse(item["price"].toString()) ?? 0;
      return sum + (price * qty);
    });
  }

  double get discount => subtotal * 0.05;
  double get total => subtotal - discount;

  /// 🔥 TOTAL QTY
  int get totalQty {
    return items.fold(0, (sum, item) {
      return sum + (int.tryParse(item["qty"].toString()) ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = items.isNotEmpty ? items.first : {};
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          label: Text(
            'Pending',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: .w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              'Check Status',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: .w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text("Booking ID",
                      style: TextStyle(color: Colors.grey)),
                  const Spacer(),
                  Text("#${item["id"] ?? "123"}",
                      style: const TextStyle(color: Colors.purple)),
                ],
              ),
            ),

            const Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["serviceName"] ?? "",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text("Date: ${item["date"] ?? ""}"),
                      Text("Time: ${item["time"] ?? ""}"),
                      const SizedBox(height: 5),
                      Text("Quantity: x$totalQty"),
                    ],
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(item["image"] ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("About Customer",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Card(
                color: Colors.grey.shade100,
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(height: 10),
                        Text(item["customerName"] ?? "Customer"),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(Icons.email, size: 18),
                            const SizedBox(width: 10),
                            Text(item["email"] ?? "example@gmail.com"),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 18),
                            const SizedBox(width: 10),
                            Text(item["address"] ?? "Address"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("Payment Details",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            Center(
              child: Card(
                color: Colors.grey.shade100,
                child: SizedBox(
                  width: 340,
                  child: Column(
                    children: [
                      row("Method", "Cash"),
                      row("Status", "Pending", color: Colors.orange),
                      row("Subtotal",
                          "Rs ${subtotal.toStringAsFixed(2)}"),
                    ],
                  ),
                ),
              ),
            ),

            /// PRICE DETAIL (UI SAME)
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("Price Detail",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            Center(
              child: Card(
                color: Colors.grey.shade100,
                child: SizedBox(
                  width: 340,
                  child: Column(
                    children: [
                      row("Rate", "Rs ${item["price"]}"),
                      row("Quantity", "x$totalQty"),
                      row("Discount",
                          "- Rs ${discount.toStringAsFixed(2)}",
                          color: Colors.green),
                      row("Total",
                          "Rs ${total.toStringAsFixed(2)}",
                          isBold: true,
                          color: Colors.purple),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  Widget row(String title, String value,
      {Color? color, bool isBold = false}) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: color ?? Colors.black,
              fontWeight:
              isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}