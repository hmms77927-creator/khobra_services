import 'package:get/get.dart';

import '../Models/Repository/user_repository.dart';
import '../Models/user_model.dart';
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
  final UserRepository _repo = UserRepository();

  var isLoading = false.obs;

  // Add User
  Future<void> addUser(UserModel user) async {
    try {
      isLoading(true);
      await _repo.addUser(user);
    } finally {
      isLoading(false);
    }
  }

  // Delete User
  Future<void> deleteUser(String id) async {
    await _repo.deleteUser(id);
  }
}