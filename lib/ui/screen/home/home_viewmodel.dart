import 'package:socchat/core/other/base_view_model.dart';
import 'package:socchat/core/services/database_service.dart';

class HomeViewmodel extends BaseViewModel {
  final DatabaseService _db;

  HomeViewmodel(
    this._db,
  );

  // fecthUserData(String uid) async {
  //   setstate(ViewState.loading);
  //   final response = await _db.loadUser(uid);

  //   if (response != null) _currentUser = UserModel.fromMap(response);
  //   setstate(ViewState.idle);
  // }
}
