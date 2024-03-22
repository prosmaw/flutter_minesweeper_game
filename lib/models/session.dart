import 'package:demineur/models/grid.dart';
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

  Grid _grid;

  Grid get grid => _grid;

  set grid(Grid value) {
    _grid = value;
  }

  Session(
      this._flagSelected, this._remainMines, this._time, this._win, this._grid);
}

class SessionController extends GetxController {
  var sessionController = Session(false, 0, "", false, Grid(0, 0)).obs;
  updateSession(Session sess) {
    sessionController.update((val) {
      val!._flagSelected = sess._flagSelected;
      val._grid = sess._grid;
      val._remainMines = sess._remainMines;
      val._time = sess._time;
      val._win = sess._win;
    });
  }
}
