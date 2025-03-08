import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Sign up user
  Future<User?> signUp(String email, String password) async {
    try {
      final authCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authCredential.user != null) {
        log("User creation successful");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message ?? "Unknown FirebaseAuth error during sign-up");
      rethrow;
    } catch (e) {
      log("Error during sign-up: ${e.toString()}");
      rethrow;
    }
    return null;
  }

  // Login user
  Future<User?> login(String email, String password) async {
    try {
      final authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (authCredential.user != null) {
        log("User logged in successfully");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message ?? "Unknown FirebaseAuth error during login");
      rethrow;
    } catch (e) {
      log("Error during login: ${e.toString()}");
      rethrow;
    }
    return null;
  }

  // Logout user
  Future<void> logout() async {
    try {
      await _auth.signOut();
      log("User signed out successfully");
    } catch (e) {
      log("Error during sign-out: ${e.toString()}");
    }
  }

  // Get current user
  User? get currentUser {
    return _auth.currentUser;
  }

  // Check if user is logged in
  bool get isLoggedIn {
    return _auth.currentUser != null;
  }
}
