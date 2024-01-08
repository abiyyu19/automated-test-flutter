import 'package:automated_test_flutter/data/repositories/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication implements Authentication {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Stream<User?> get user => _firebaseAuth.authStateChanges();

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  @override
  Future<String> logout() async {
    try {
      await _firebaseAuth.signOut();
      return 'User logged out';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
