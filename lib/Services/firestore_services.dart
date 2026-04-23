import 'package:cloud_firestore/cloud_firestore.dart';

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

