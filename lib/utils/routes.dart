import 'package:demineur/views/screens/game_page.dart';
import 'package:demineur/views/screens/home_screen.dart';
import 'package:demineur/views/screens/settings.dart';
import 'package:demineur/views/screens/statistic_page.dart';
import 'package:get/get.dart';

class Routes {
  static String Home = "/";
  static String GamePage = "/gamePage";
  static String SettingsPage = "/settings";
  static String StatisticsPage = "/statistics";
}

final getPages = [
  GetPage(name: Routes.Home, page: () => const HomeScreen()),
  GetPage(name: Routes.GamePage, page: () => GamePage()),
  GetPage(name: Routes.SettingsPage, page: () => const Settings()),
  GetPage(name: Routes.StatisticsPage, page: () => StatisticsPage())
];
