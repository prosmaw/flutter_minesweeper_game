import 'package:demineur/models/case.dart';
import 'package:demineur/models/grid.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';
import 'package:demineur/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Casewidget extends StatelessWidget {
  CaseModel caseModel;
  Casewidget({super.key, required this.caseModel});

  SessionController sessionController = Get.find<SessionController>();

  GridController gridController = Get.find<GridController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("isMined: ${caseModel.isMined}");
        if (!sessionController.session.flagSelected &&
            caseModel.isMined &&
            !caseModel.isFlaged) {
          sessionController.updateLoseState(true);
          sessionController.stopTimer();
          loseDialog(context);
        } else {
          //widget.caseModel.grid.unCoverCases(widget.caseModel);
          gridController.updateGrid(caseModel);
        }
      },
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: caseModel.unCovered
                  ? BaseColors.darkSecondary
                  : Color.fromARGB(255, 199, 184, 184),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(strokeAlign: BorderSide.strokeAlignOutside)),
          child: caseModel.unCovered //check if unCovered
              ? caseModel.isMined
                  ? SvgPicture.asset(
                      "assets/images/bomb.svg",
                      height: 20,
                      width: 20,
                    )
                  : Center(
                      child: Text(
                        caseModel.nearbyMine,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
              : caseModel.isFlaged
                  ? SvgPicture.asset("assets/images/flagad.svg")
                  : SizedBox()),
    );
  }

  void loseDialog(BuildContext context) {
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
                      sessionController.reload();
                      gridController.reload();
                      Get.back();
                    },
                    child: Text("Try again"))
              ],
            );
          });
    }
  }
}
