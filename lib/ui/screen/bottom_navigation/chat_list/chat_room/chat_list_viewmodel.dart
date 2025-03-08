import 'dart:developer';

import 'package:socchat/core/enums/enums.dart';
import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/core/other/base_view_model.dart';
import 'package:socchat/core/services/database_service.dart';

class ChatListViewmodel extends BaseViewModel {
  final DatabaseService _db;

  final UserModel _currentUser;

  ChatListViewmodel(this._db, this._currentUser) {
    fecthUsers();
  }
  List<UserModel> _users = [];
  List<UserModel> _filteredUsers = [];

  List<UserModel> get users => _users;
  List<UserModel> get filteredUsers => _filteredUsers;

  search(String value) {
    _filteredUsers =
        _users.where((e) => e.name!.toLowerCase().contains(value)).toList();
    notifyListeners();
  }

  fecthUsers() async {
    try {
      setstate(ViewState.loading);
      final res = await _db.fecthUsers(_currentUser.uid!);
      if (res != null) {
        _users = res.map((e) => UserModel.fromMap(e)).toList();
        _filteredUsers = users;
        notifyListeners();
      }
      setstate(ViewState.idle);
    } catch (e) {
      setstate(ViewState.idle);

      log("Error fecthing useres");
    }
  }
}
