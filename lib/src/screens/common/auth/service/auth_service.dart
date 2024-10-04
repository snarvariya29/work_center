import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthService();

  Future<User?> login(String email, String password) async {
    try {
      final creds = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return creds.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future createAccount(String email, String password) async {
    try {
      final creds = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return creds.user;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Stream<User?> getCurrentUserStream() {
    return _firebaseAuth.userChanges();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
