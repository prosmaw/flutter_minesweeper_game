import 'package:demineur/controllers/grid_controller.dart';
import 'package:demineur/controllers/session_controller.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';
import 'package:demineur/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:demineur/views/widgets/bottom_rounded.dart';
import 'package:demineur/views/widgets/casewidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  final Session session = Session(0, false, false);

  final GridController gridController = Get.put(GridController());

  final SessionController sessionController = Get.put(SessionController());

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
                              "Mines left: ${gridController.grid.minesNumber}",
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
                                    crossAxisCount: gridController.grid.col),
                            itemCount: (gridController.grid.col *
                                gridController.grid.col),
                            itemBuilder: (BuildContext context, int index) {
                              return Casewidget(
                                caseModel: gridController.grid.cases[index],
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
}
