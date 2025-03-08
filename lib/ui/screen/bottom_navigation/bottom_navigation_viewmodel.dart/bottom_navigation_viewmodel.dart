import 'package:socchat/core/other/base_view_model.dart';

class BottomNavigationViewmodel extends BaseViewModel {
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  setIndex(int value) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }
}
