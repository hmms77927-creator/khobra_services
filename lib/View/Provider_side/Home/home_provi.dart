import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/Constant/app-images.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../Booking/book_list.dart';
import '../Booking/book_services.dart';
import '../Handyman/handyman_list.dart';

class HomeProvi extends StatefulWidget {
  const HomeProvi({super.key});

  @override
  State<HomeProvi> createState() => _HomeProviState();
}

class _HomeProviState extends State<HomeProvi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person_3_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      homeProvidercontain(
                        text: '98',
                        title: 'Total Booking',
                        image: AppImages.ticket, onTap: () {
                          Get.to(BookServices());
                      },
                      ),
                      homeProvidercontain(
                        text: '15',
                        title: 'Total Service',
                        image: AppImages.document, onTap: () { Get.to(BookList()); },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      homeProvidercontain(
                        text: '30',
                      onTap: () { Get.to( HandymanList()); }   ,title: 'Driver',
                        image: AppImages.home_3,
                      ),
                      homeProvidercontain(
                        text: '₹45.3',
                        title: 'Total Earning',
                        image: AppImages.discount,
                        onTap: () { Get.to(BookList());
                      },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 10),
              child: Center(
                child: Text(
                  "Monthly Revenue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 164,
                width: 319,
                child: BarChart(
                  BarChartData(
                    minY: 0,
                    maxY: 15000,
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 5000,
                      checkToShowHorizontalLine: (value) {
                        // only 0, 5000, 10000, 15000
                        return value == 0 ||
                            value == 5000 ||
                            value == 10000 ||
                            value == 15000;
                      },
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: value == 0 ? Colors.black : Colors.grey,
                          strokeWidth: value == 0 ? 1.5 : 0.5,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: 5000,
                          getTitlesWidget: (value, meta) {
                            if (value == 0 ||
                                value == 5000 ||
                                value == 10000 ||
                                value == 15000) {
                              return Text(
                                value.toInt().toString(),
                                style: TextStyle(fontSize: 9),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              "Jan",
                              "Feb",
                              "Mar",
                              "Apr",
                              "May",
                              "Jun",
                              "Jul",
                              "Aug",
                            ];
                            if (value.toInt() >= months.length)
                              return const SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                months[value.toInt()],
                                style: TextStyle(fontSize: 9),
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    barGroups: [
                      _bar(0, 5000),
                      _bar(1, 10000),
                      _bar(2, 0),
                      _bar(3, 0),
                      _bar(4, 0),
                      _bar(5, 0),
                      _bar(6, 0),
                      _bar(7, 0),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _bar(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: value, width: 10, color: AppColors.purple),
      ],
    );
  }
}
