import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Services/firestore_services.dart';
import '../user_model.dart';

class UserRepository {
  final FirestoreServices _service = FirestoreServices();

  Future<void> addUser(UserModel user) => _service.saveUser(user);

  Stream<List<UserModel>> getUsers() => _service.getUsers();
}



class ProviderRepository {
  final FirestoreProvider service = FirestoreProvider();

  Future<void> addProvider(ProviderModel provider) {
    return service.saveProvider(provider);
  }

  Stream<List<ProviderModel>> getProviders() {
    return service.getProviders();
  }
}




class DriverRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addDriver(DriverModel driver) async {
    await firestore.collection("drivers").add(driver.toMap());
  }

  Stream<List<DriverModel>> getDrivers() {
    return firestore.collection("drivers").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DriverModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> deleteDriver(String id) async {
    await firestore.collection("drivers").doc(id).delete();
  }

  Future<void> updateDriver(String id, Map<String, dynamic> data) async {
    await firestore.collection("drivers").doc(id).update(data);
  }
}