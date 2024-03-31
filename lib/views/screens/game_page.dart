import 'package:demineur/models/case.dart';
import 'package:demineur/models/grid.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';
import 'package:demineur/views/screens/home_screen.dart';
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
  Session session = Session(false, 0, 0, false, false);
  Grid grid = Grid(16, 16);
  GridController gridController = Get.put(GridController());
  SessionController sessionController = Get.put(SessionController());
  List<CaseModel> listCases = [];

  @override
  void initState() {
    super.initState();
    listCases = grid.Casecreation();
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<SessionController>(builder: (_) {
        int minutes = sessionController.session.time ~/ 60;
        int seconds = sessionController.session.time % 60;
        String minuteString = minutes.toString().padLeft(2, '0');
        String secondString = seconds.toString().padLeft(2, '0');
        return GetBuilder<GridController>(builder: (_) {
          print("Flag selected: ${sessionController.session.flagSelected}");
          return Container(
            height: height,
            width: width,
            color: BaseColors.primaryColor1,
            child: SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                  ),
                  Positioned(
                      top: height * 0.20,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mines left: ${sessionController.session.remainMines}",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text("${minuteString}:${secondString}",
                                style: TextStyle(fontSize: 22))
                          ],
                        ),
                      )),
                  Positioned(
                      top: (height * 0.25),
                      child: Container(
                        width: width - 20,
                        height: height * 0.5,
                        margin: EdgeInsets.all(10),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: grid.col),
                            itemCount: (grid.col * grid.row),
                            itemBuilder: (BuildContext context, int index) {
                              gridController.addCase(listCases[index]);
                              return Casewidget(
                                caseModel:
                                    gridController.casesController[index],
                              );
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
                      Get.off(() => HomeScreen());
                    },
                    rightIcon: Icons.replay,
                    ontapRight: () {
                      sessionController.reload();
                      gridController.reload();
                      grid = Grid(16, 16);
                      listCases = grid.Casecreation();
                    },
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  void loseDialog() {
    if (sessionController.session.lose) {
      showAdaptiveDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Game Over",
                style: TextStyle(color: BaseColors.darkSecondary),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/gif/explosion.gif",
                    height: 200,
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    child: Text("Home")),
                TextButton(
                    onPressed: () {
                      Get.back();
                      Get.off(() => GamePage());
                    },
                    child: Text("Try again"))
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
