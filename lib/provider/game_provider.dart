import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:squares/squares.dart';

class GameProvider extends ChangeNotifier {
  bool _vsComputer = false;
  bool _isLoading = false;
  int _player = Squares.white;
  PlayerColor _playerColor = PlayerColor.white;

  Duration _whitesTime = Duration.zero;
  Duration _blacksTime = Duration.zero;

  Duration _savedWhitesTime = Duration.zero;
  Duration _savedBlacksTime = Duration.zero;

  int get player => _player;
  PlayerColor get playerColor => _playerColor;
  Duration get whitesTime => _whitesTime;
  Duration get blacksTime => _blacksTime;
  Duration get savedWhitesTime => _savedWhitesTime;
  Duration get savedBlacksTime => _savedBlacksTime;

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

  Future<void> setGameTime(
      {required String newSavedWhitesTime,
      required String newSavedBlacksTime}) async {
    _savedWhitesTime = Duration(
      minutes: int.parse(newSavedWhitesTime),
    );
  }
}
