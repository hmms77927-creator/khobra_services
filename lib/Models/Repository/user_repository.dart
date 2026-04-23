


import '../../Services/firestore_services.dart';
import '../user_model.dart';

class UserRepository {
  final FirestoreServices _service = FirestoreServices();

  Future<void> addUser(UserModel user) => _service.saveUser(user);

  Stream<List<UserModel>> getUsers() => _service.getUsers();
}