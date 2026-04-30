import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Models/Repository/user_repository.dart';
import '../Models/user_model.dart';
import '../Services/firestore_services.dart';
import '../Services/services_auth.dart';


class AuthController extends GetxController {
  final AuthService authService = AuthService();

  var isLoading = false.obs;
  Future<void> resetPassword(String email) async {
    try {
      isLoading.value = true;

      bool result = await authService.forgotPassword(email);

      if (result) {
        Get.snackbar("Success", "Reset link sent to email");
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}



class UserController extends GetxController {
  final repo = UserRepository();

  var isLoading = false.obs;
  var userList = <UserModel>[].obs;
  var currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    repo.getUsers().listen((users) {
      userList.value = users;

      if (users.isNotEmpty) {
        currentUser.value = users.last;
      } else {
        currentUser.value = null;
      }
    });
  }

  Future<void> addUser(
      String name,
      String lastname,
      String phone,
      String address,
      String image,
      ) async {
    try {
      isLoading.value = true;

      final user = UserModel(
        id: '',
        name: name,
        lastname: lastname,
        phonenumber: phone,
        address: address,
        image: image,
        email: '',
      );

      await repo.addUser(user);

    } catch (e) {
      print("ADD USER ERROR: $e");

    } finally {
      isLoading.value = false;
    }
  }
}




class ProviderController extends GetxController {
  final repo = ProviderRepository();

  var isLoading = false.obs;
  var currentProvider = Rxn<ProviderModel>();

  @override
  void onInit() {
    super.onInit();
    fetchProvider();
  }

  void fetchProvider() {
    repo.getProviders().listen((providers) {
      if (providers.isNotEmpty) {
        currentProvider.value = providers.last;
      } else {
        currentProvider.value = null;
      }
    });
  }

  Future<void> addProvider(
      String person,
      String person1,
      String email,
      String password,
      String phone,
      String city,
      String state,
      String country,
      String address,
      String image,
      ) async {
    try {
      isLoading.value = true;

      final provider = ProviderModel(
        id: '',
        person: person,
        person1: person1,
        email: email,
        password: password,
        phonenumber: phone,
        city: city,
        state: state,
        country: country,
        address: address,
        image: image,
      );

      await repo.addProvider(provider);

    } catch (e) {
      print("ERROR: $e");
    } finally {
      isLoading.value = false;
    }
  }
}



class DriverController extends GetxController {
  var driverList = <DriverModel>[].obs;
  var pickedImage = ''.obs;
  var isLoading = false.obs;

  final firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchDrivers();
  }

  /// PICK IMAGE
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      pickedImage.value = picked.path;
    }
  }

  /// ADD DRIVER
  Future<void> addDriver(DriverModel driver) async {
    try {
      isLoading.value = true;

      await firestore.collection("drivers").add(driver.toMap());

      pickedImage.value = "";
    } catch (e) {
      print("ADD ERROR: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// FETCH DRIVERS
  void fetchDrivers() {
    firestore.collection("drivers").snapshots().listen((snapshot) {
      driverList.value = snapshot.docs.map((doc) {
        return DriverModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}




class ServiceController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var serviceList = [].obs;
  var imagePath = ''.obs;

  /// PICK IMAGE (TEMP)
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imagePath.value = picked.path;
    }
  }

  /// ADD SERVICE
  Future<void> addService(Map<String, dynamic> data) async {
    await firestore.collection("add_services").add(data);
  }

  /// FETCH SERVICES
  void fetchServices() {
    firestore.collection("add_services").snapshots().listen((snapshot) {
      serviceList.value = snapshot.docs.map((doc) {
        return {
          "id": doc.id,
          ...doc.data(),
        };
      }).toList();
    });
  }
}






class BookingController extends GetxController {
  var bookings = <BookingItem>[].obs;

  /// ➕ ADD ITEM (AUTO INCREASE QUANTITY)
  void addItem(Map item) {
    int index = bookings.indexWhere(
          (e) => e.name == item["serviceName"],
    );

    if (index != -1) {
      bookings[index].quantity++;
    } else {
      bookings.add(
        BookingItem(
          name: item["serviceName"],
          price: double.tryParse(item["price"].toString()) ?? 0,
          hours: item["hours"] ?? 0,
          minutes: item["minutes"] ?? 0,
          image: item["image"] ?? "",
        ),
      );
    }

    bookings.refresh();
  }

  /// ➖ DECREASE
  void decrease(int index) {
    if (bookings[index].quantity > 1) {
      bookings[index].quantity--;
    } else {
      bookings.removeAt(index);
    }

    bookings.refresh();
  }

  /// 🔥 TOTAL PRICE (AUTO SUM)
  double get total =>
      bookings.fold(0, (sum, item) => sum + item.subtotal);
}


