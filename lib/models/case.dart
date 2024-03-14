class CaseModel {
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

  CaseModel(this._x, this._y, this._isMined);
}
