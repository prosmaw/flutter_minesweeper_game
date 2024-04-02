import 'package:hive/hive.dart';
part 'session.g.dart';

@HiveType(typeId: 1)
class Session {
  @HiveField(0)
  int _time;

  int get time => _time;

  set time(int value) {
    _time = value;
  }

  @HiveField(1)
  bool _win;

  bool get win => _win;

  set win(bool value) {
    _win = value;
  }

  @HiveField(2)
  bool _lose;

  bool get lose => _lose;

  set lose(bool value) {
    _lose = value;
  }

  bool flagSelected = false;

  Session(this._time, this._win, this._lose);
}
