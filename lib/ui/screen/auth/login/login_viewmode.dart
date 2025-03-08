import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:socchat/core/enums/enums.dart';
import 'package:socchat/core/other/base_view_model.dart';
import 'package:socchat/core/services/auth_service.dart';

class LoginViewmode extends BaseViewModel {
  final AuthService _authService;
  LoginViewmode(this._authService);

  String email = "";
  String password = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
    log("Email is : $email");
  }

  setPassword(String value) {
    password = value;
    notifyListeners();
    log("password is : $password");
  }

  login() async {
    setstate(ViewState.loading);
    try {
      await _authService.login(email, password);
      setstate(ViewState.idle);
    } on FirebaseAuthException {
      setstate(ViewState.idle);
      rethrow;
    } catch (e) {
      setstate(ViewState.idle);
      log(e.toString());
      rethrow;
    }
  }
}
