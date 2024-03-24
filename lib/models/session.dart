import 'package:get/get.dart';

class Session {
  String _time;

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  bool _win;

  bool get win => _win;

  set win(bool value) {
    _win = value;
  }

  bool _lose;

  bool get lose => _lose;

  set lose(bool value) {
    _lose = value;
  }

  bool _flagSelected;

  bool get flagSelected => _flagSelected;

  set flagSelected(bool value) {
    _flagSelected = value;
  }

  int _remainMines;

  int get remainMines => _remainMines;

  set remainMines(int value) {
    _remainMines = value;
  }

  Session(
      this._flagSelected, this._remainMines, this._time, this._win, this._lose);
}

class SessionController extends GetxController {
  var sessionController = Session(false, 0, "", false, false).obs;

  updateFlagState(bool isSelected) {
    sessionController.update((val) {
      val!._flagSelected = isSelected;
    });
  }

  updateTime(String time) {
    sessionController.update((val) {
      val!._time = time;
    });
  }

  updateWinState(bool win) {
    sessionController.update((val) {
      val!._win = win;
    });
  }

  updateLoseState(bool lose) {
    sessionController.update((val) {
      val!._lose = lose;
    });
  }

  updateMines(int mines) {
    sessionController.update((val) {
      val!._remainMines = mines;
    });
  }
}
