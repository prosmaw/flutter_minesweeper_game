import 'dart:async';

import 'package:demineur/models/session.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SessionController extends GetxController {
  var _session = Session(0, false, false).obs;
  Timer gameTimer = Timer(Duration(seconds: 1), () {});

  Session get session => _session.value;

  void updateTimer() {
    gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      session.time += 1;
      update();
    });
  }

  @override
  void onInit() {
    ever(_session, (callback) {
      if (session.lose || session.win) {
        saveSession();
      }
    });
    super.onInit();
  }

  void saveSession() async {
    var sessionBox = await Hive.openBox<Session>('sessionBox');
    sessionBox.add(session);
  }

  void stopTimer() {
    gameTimer.cancel();
  }

  void reload() {
    stopTimer();
    _session.update((val) {
      val!.flagSelected = false;
      val.lose = false;
      val.win = false;
      val.time = 0;
    });
    update();
  }

  updateFlagState(bool isSelected) {
    _session.update((val) {
      val!.flagSelected = isSelected;
    });
  }

  updateTime(int time) {
    _session.update((val) {
      val!.time = time;
    });
  }

  updateWinState(bool win) {
    _session.update((val) {
      val!.win = win;
    });
  }

  updateLoseState(bool lose) {
    _session.update((val) {
      val!.lose = lose;
    });
  }
}
