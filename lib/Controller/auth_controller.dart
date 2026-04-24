import 'dart:async';
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
  final repo = DriverRepository();

  var isLoading = false.obs;
  var driverList = <DriverModel>[].obs;

  var pickedImage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrivers();
  }

  void fetchDrivers() {
    repo.getDrivers().listen((data) {
      driverList.value = data;
    });
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final img = await picker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      pickedImage.value = img.path;
    }
  }

  Future<void> addDriver(DriverModel driver) async {
    try {
      isLoading.value = true;
      await repo.addDriver(driver);
      pickedImage.value = "";
    } finally {
      isLoading.value = false;
    }
  }
}