import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socchat/core/enums/enums.dart';
import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/core/other/base_view_model.dart';
import 'package:socchat/core/services/auth_service.dart';
import 'package:socchat/core/services/database_service.dart';

class SignupViewmodel extends BaseViewModel {
  final AuthService _authService;
  final DatabaseService _db;
  SignupViewmodel(this._authService, this._db);
  String name = "";
  String password = "";
  String email = "";
  String confirmpassword = "";
  File? _image;

  File? get image => _image;

  pickimage() {
    ImagePick
  }

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

  void setName(String value) {
    name = value;
    notifyListeners();
    log("name is : $email");
  }

  setConfirmPassword(String value) {
    confirmpassword = value;
    notifyListeners();
    log("confirm password is : $password");
  }

  signup() async {
    setstate(ViewState.loading);
    try {
      if (password != confirmpassword) {
        throw Exception("Password Do not match");
      }
      final response = await _authService.signUp(email, password);
      if (response != null) {
        UserModel user = UserModel(uid: response.uid, name: name, email: email);
        await _db.saveUser(user.toMap());
      }

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
