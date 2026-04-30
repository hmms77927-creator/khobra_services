import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Models/user_model.dart';
class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async {
    final doc = _firestore.collection('users').doc();

    await doc.set(user.toMap()..addAll({"id": doc.id}));
  }

  Stream<List<UserModel>> getUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    });
  }
}



class FirestoreProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProvider(ProviderModel provider) async {
    final doc = _firestore.collection('providers').doc();

    await doc.set(provider.toMap()..addAll({'id': doc.id}));
  }

  Stream<List<ProviderModel>> getProviders() {
    return _firestore.collection('providers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProviderModel.fromMap(doc.data());
      }).toList();
    });
  }
}





class ServiceController extends GetxController {
  var serviceList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenServices();
  }

  void listenServices() {
    FirebaseFirestore.instance
        .collection("services")
        .snapshots() // 🔥 REAL-TIME
        .listen((snapshot) {
      serviceList.value =
          snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}