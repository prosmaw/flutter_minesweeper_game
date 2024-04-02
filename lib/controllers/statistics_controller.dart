import 'package:demineur/models/session.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class StatisticController extends GetxController {
  var fieldsAttempt = 0.obs;
  var fieldSwept = 0.obs;
  int timeTotal = 0;
  double timeAverage = 0;
  var totalTime = "00h 00m 00S".obs;
  var averageTime = "00h 00m 00s".obs;
  //List<Session> sessionList = [];
  @override
  void onInit() async {
    super.onInit();
    var sessionBox = await Hive.openBox<Session>('sessionBox');
    if (!sessionBox.isEmpty) {
      fieldsAttempt.value = sessionBox.length + 1;
      for (int i = 0; i < sessionBox.length; i++) {
        Session session = sessionBox.get(i) as Session;
        if (session.win) {
          fieldSwept += 1;
        }
        timeTotal += session.time;
      }
      timeAverage = timeTotal / (fieldsAttempt.toInt());
      totalTime.value = StringTime(timeTotal);
      averageTime.value = StringTime(timeAverage);
      update();
    }
  }

  String StringTime(time) {
    int hour = time ~/ 3600;
    int secondRemain = time.toInt() % 3600;
    int minutes = secondRemain ~/ 60;
    int seconds = secondRemain % 60;
    return "${hour}h ${minutes}m ${seconds}s";
  }
}
