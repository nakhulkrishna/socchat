import 'package:flutter/material.dart';
import 'package:socchat/core/enums/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  setstate(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
