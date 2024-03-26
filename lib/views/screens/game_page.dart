import 'dart:async';

import 'package:demineur/models/case.dart';
import 'package:demineur/models/grid.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';
import 'package:get/get.dart';
import 'package:demineur/views/widgets/bottom_rounded.dart';
import 'package:demineur/views/widgets/casewidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer gameTimer;
  int counter = 0;
  Session session = Session(false, 0, "", false, false);
  Grid grid = Grid(10, 10);
  GridController gridController = Get.put(GridController());
  SessionController sessionController = Get.put(SessionController());
  List<CaseModel> listCases = [];

  @override
  void initState() {
    super.initState();
    listCases = grid.Casecreation();
    gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter++;
      });
    });
  }

  void winDialog() {
    if (sessionController.session.win) {
      showAdaptiveDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("You Win"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/gif/win_animation.gif",
                    height: 100,
                  )
                ],
              ),
              actions: [
                TextButton(onPressed: () {}, child: Text("Home")),
                TextButton(onPressed: () {}, child: Text("Try again"))
              ],
            );
          });
    }
  }

  String get timerString {
    int minutes = counter ~/ 60;
    int seconds = counter % 60;
    String minuteString = minutes.toString().padLeft(2, '0');
    String secondString = seconds.toString().padLeft(2, '0');
    return '$minuteString:$secondString';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: BaseColors.primaryColor1,
        child: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/logo.png",
              ),
              Positioned(
                  top: height * 0.20,
                  child: Obx(() => Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mines left: ${sessionController.session.remainMines}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(timerString, style: TextStyle(fontSize: 22))
                          ],
                        ),
                      ))),
              Positioned(
                  top: (height * 0.25),
                  child: Container(
                    width: width - 20,
                    height: height * 0.5,
                    margin: EdgeInsets.all(10),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          gridController.addCase(listCases[index]);
                          return Obx(() => Casewidget(
                                caseModel:
                                    gridController.casesController[index],
                              ));
                        }),
                  )),
              Positioned(
                  top: height * 0.75,
                  child: SizedBox(
                    height: 70,
                    width: width,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (!session.flagSelected) {
                            session.flagSelected = true;
                            sessionController
                                .updateFlagState(session.flagSelected);
                          } else if (session.flagSelected) {
                            session.flagSelected = false;
                            sessionController
                                .updateFlagState(session.flagSelected);
                          }
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(180)),
                          child: SvgPicture.asset(
                            "assets/images/flagad.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  )),
              BottomRoundedRow(
                width: width,
                LeftIcon: Icons.home,
                ontapLeft: () {
                  Navigator.pop(context);
                },
                rightIcon: Icons.replay,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    gameTimer.cancel();
  }
}
