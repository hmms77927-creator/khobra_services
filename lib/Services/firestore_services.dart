import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> data) async {
    await _firestore.collection('users').add(data);
  }

  Future<void> updateUser(String docId, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(docId).update(data);
  }

  Future<void> deleteUser(String docId) async {
    await _firestore.collection('users').doc(docId).delete();
  }
}

