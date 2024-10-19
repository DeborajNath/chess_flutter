import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  bool _vsComputer = false;
  bool _isLoading = false;

  bool get vsComputer => _vsComputer;
  bool get isLoading => _isLoading;

  void setComputer(bool value) {
    _vsComputer = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
