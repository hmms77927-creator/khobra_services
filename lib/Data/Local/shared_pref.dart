import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveBooking(Map item) async {
    List<String> list = prefs?.getStringList("bookings") ?? [];

    list.add(jsonEncode(item));

    await prefs?.setStringList("bookings", list);
  }

  static List<Map> getBookings() {
    List<String> list = prefs?.getStringList("bookings") ?? [];

    return list.map((e) => jsonDecode(e) as Map).toList();
  }

  static Future clearBookings() async {
    await prefs?.remove("bookings");
  }
}