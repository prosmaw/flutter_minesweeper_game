import 'dart:math';

import 'package:demineur/controllers/statistics_controller.dart';
import 'package:demineur/utils/routes.dart';
import 'package:demineur/views/widgets/bottom_rounded.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});
  final StatisticController statisticController =
      Get.put(StatisticController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<StatisticController>(builder: (_) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 30, 72, 110),
              Color.fromARGB(255, 102, 182, 225),
            ],
            transform: GradientRotation(-pi / 2),
          )),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  top: 30,
                  child: Container(
                    width: width - (width * 0.3),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    child: Center(
                      child: Text(
                        "Statistics",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Positioned(
                  top: 120,
                  child: Container(
                    width: width - (width * 0.3),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    child: Center(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Fields Attempted",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("${statisticController.fieldsAttempt}",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Fields Swept",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("${statisticController.fieldSwept}",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Total Playtime",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("${statisticController.totalTime}",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Average Time per field",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("${statisticController.averageTime}",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Challenges Completed",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("24 game challenges",
                                  style: TextStyle(fontSize: 20)),
                              Text("5 daily challenges",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              BottomRoundedRow(
                width: width,
                LeftIcon: Icons.home,
                ontapLeft: () {
                  Get.back();
                },
                rightIcon: Icons.settings,
                ontapRight: () {
                  Get.toNamed(Routes.SettingsPage);
                },
              )
            ],
          )),
        );
      }),
    );
  }
}
