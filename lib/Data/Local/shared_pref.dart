// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPref {
//   static SharedPreferences? prefs;
//
//   static Future init() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   static Future saveBooking(Map item) async {
//     List<String> list = prefs?.getStringList("bookings") ?? [];
//
//     list.add(jsonEncode(item));
//
//     await prefs?.setStringList("bookings", list);
//   }
//
//   static List<Map> getBookings() {
//     List<String> list = prefs?.getStringList("bookings") ?? [];
//
//     return list.map((e) => jsonDecode(e) as Map).toList();
//   }
//
//   static Future clearBookings() async {
//     await prefs?.remove("bookings");
//   }
// }
//
//
//
//
//

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref1 {
  static SharedPreferences? prefs;

  /// INIT (must call in main)
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// =====================
  /// REVIEWS
  /// =====================

  static List<Map> getReviews() {
    final data = prefs?.getStringList("reviews") ?? [];

    return data.map((e) {
      return jsonDecode(e) as Map;
    }).toList();
  }

  static saveReviews(List<Map> reviews) {
    prefs?.setStringList(
      "reviews",
      reviews.map((e) => jsonEncode(e)).toList(),
    );
  }

  /// =====================
  /// BOOKINGS
  /// =====================

  static List<Map> getBookings() {
    final data = prefs?.getStringList("bookings") ?? [];

    return data.map((e) {
      return jsonDecode(e) as Map;
    }).toList();
  }

  static saveBookings(List<Map> bookings) {
    prefs?.setStringList(
      "bookings",
      bookings.map((e) => jsonEncode(e)).toList(),
    );
  }
}



class SharedPref {
  static SharedPreferences? prefs;

  /// INIT
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// SAVE BOOKING
  static Future<void> saveBooking(Map item) async {
    List<String> list = prefs?.getStringList("bookings") ?? [];

    list.add(jsonEncode(item));

    await prefs?.setStringList("bookings", list);
  }

  /// GET BOOKING
  static List<Map> getBookings() {
    List<String> list = prefs?.getStringList("bookings") ?? [];

    return list.map((e) => jsonDecode(e)).toList().cast<Map>();
  }

  /// CLEAR ALL
  static Future<void> clearBookings() async {
    await prefs?.remove("bookings");
  }
}