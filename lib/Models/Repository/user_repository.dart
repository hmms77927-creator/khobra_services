import '../../Services/firestore_services.dart';
import '../user_model.dart';

class UserRepository {
  final FirestoreServices _service = FirestoreServices();

  Future<void> addUser(UserModel user) {
    return _service.addUser(user.toMap());
  }

  Future<void> updateUser(String id, UserModel user) {
    return _service.updateUser(id, user.toMap());
  }

  Future<void> deleteUser(String id) {
    return _service.deleteUser(id);
  }

  // Stream getUsers() {
  //   return _service.getUsers();
  // }
}