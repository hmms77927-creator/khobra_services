import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Clock/select_time.dart';

class EndTime extends StatefulWidget {
  const EndTime({super.key});

  @override
  State<EndTime> createState() => _EndTimeState();
}

class _EndTimeState extends State<EndTime> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 9, minute: 0);

  void _updateTime(TimeOfDay newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Select End Time ',
          style: TextStyle(color: AppColors.pureblack),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 376,
              height: 588,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Align(
                        alignment: .topLeft,
                        child: Text(
                          'End time',
                          style: TextStyle(
                            color: AppColors.lightblue,
                            fontSize: 14,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hour
                      SizedBox(
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.purple,
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                            text: selectedTime.hourOfPeriod.toString().padLeft(
                              2,
                              '0',
                            ),
                          ),
                          onChanged: (val) {
                            int hour =
                                int.tryParse(val) ?? selectedTime.hourOfPeriod;
                            if (hour >= 1 && hour <= 12) {
                              // Keep AM/PM by adjusting hour
                              int newHour = selectedTime.hour >= 12
                                  ? hour + 12
                                  : hour;
                              if (selectedTime.hour < 12 &&
                                  selectedTime.hour >= 0 &&
                                  selectedTime.hour >= 12) {
                                newHour = hour; // AM
                              }
                              _updateTime(
                                TimeOfDay(
                                  hour: newHour % 24,
                                  minute: selectedTime.minute,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 50, color: Colors.black),
                      ),
                      // Minute
                      SizedBox(
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                            text: selectedTime.minute.toString().padLeft(
                              2,
                              '0',
                            ),
                          ),
                          onChanged: (val) {
                            int min = int.tryParse(val) ?? selectedTime.minute;
                            if (min >= 0 && min <= 59) {
                              _updateTime(
                                TimeOfDay(hour: selectedTime.hour, minute: min),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      // AM/PM Selector
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Set AM
                              int newHour = selectedTime.hour >= 12
                                  ? selectedTime.hour - 12
                                  : selectedTime.hour;
                              _updateTime(
                                TimeOfDay(
                                  hour: newHour,
                                  minute: selectedTime.minute,
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTime.hour < 12
                                    ? Colors.purple[100]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "AM",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              // Set PM
                              int newHour = selectedTime.hour < 12
                                  ? selectedTime.hour + 12
                                  : selectedTime.hour;
                              _updateTime(
                                TimeOfDay(
                                  hour: newHour,
                                  minute: selectedTime.minute,
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTime.hour >= 12
                                    ? Colors.purple[100]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "PM",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Analog Clock
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: CustomPaint(painter: ClockPainter(selectedTime)),
                  ),
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 18.58,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 18.58,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenTimePicker(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios, color: AppColors.purple),
                    label: Text(
                      'previous',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 18.58,
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.58,
                          fontWeight: .w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Analog Clock Painter
class ClockPainter extends CustomPainter {
  final TimeOfDay time;
  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Clock background
    canvas.drawCircle(center, radius, Paint()..color = Colors.grey.shade200);

    // Paint object for hands
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Hour hand
    final hourAngle = ((time.hourOfPeriod + time.minute / 60) * 30) * pi / 180;
    paint.color = Colors.black;
    paint.strokeWidth = 6;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 0.5 * radius * sin(hourAngle),
        center.dy - 0.5 * radius * cos(hourAngle),
      ),
      paint,
    );

    // Minute hand
    final minuteAngle = (time.minute * 6) * pi / 180;
    paint.color = Colors.black;
    paint.strokeWidth = 4;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 0.7 * radius * sin(minuteAngle),
        center.dy - 0.7 * radius * cos(minuteAngle),
      ),
      paint,
    );

    // Second hand (optional: here synced with minute)
    final secondAngle = (time.minute * 6) * pi / 180;
    paint.color = Colors.red;
    paint.strokeWidth = 2;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 0.8 * radius * sin(secondAngle),
        center.dy - 0.8 * radius * cos(secondAngle),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
