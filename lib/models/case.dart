import 'package:demineur/models/grid.dart';

class CaseModel {
  int _index;

  int get index => _index;

  set index(int value) {
    _index = value;
  }

  int _x;

  int get x => _x;

  set x(int value) {
    _x = value;
  }

  int _y;

  int get y => _y;

  set y(int value) {
    _y = value;
  }

  bool _isMined;

  bool get isMined => _isMined;

  set isMined(bool value) {
    _isMined = value;
  }

  bool _unCovered;

  bool get unCovered => _unCovered;

  set unCovered(bool value) {
    _unCovered = value;
  }

  Grid _grid;

  Grid get grid => _grid;

  set grid(Grid value) {
    _grid = value;
  }

  CaseModel(this._index, this._x, this._y, this._isMined, this._unCovered,
      this._grid);
}
