import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/Repository/user_repository.dart';
import '../Models/user_model.dart';
import '../Services/firestore_services.dart';
import '../Services/services_auth.dart';


class AuthController extends GetxController {
  final AuthService authService = AuthService();

  var isLoading = false.obs;

  // 🔥 FORGOT PASSWORD CONTROLLER METHOD
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
