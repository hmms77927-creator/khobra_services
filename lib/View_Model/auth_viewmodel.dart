
import 'package:firebase_auth/firebase_auth.dart';
import '../Services/services_auth.dart';

class AuthViewModel {
  final AuthService _authService = AuthService();

  Future<User?> signup(String email, String password) async {
    try {
      return await _authService.signup(email, password);
    } catch (e) {
      print('Signup Error: $e');
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      return await _authService.login(email, password);
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }
}