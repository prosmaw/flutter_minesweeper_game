import 'package:demineur/controllers/grid_controller.dart';
import 'package:demineur/controllers/session_controller.dart';
import 'package:demineur/models/case.dart';
import 'package:demineur/utils/colors.dart';
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
      onTap: onClick,
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

  void onClick() async {
    if (!sessionController.session.flagSelected &&
        caseModel.isMined &&
        !caseModel.isFlaged) {
      sessionController.stopTimer();
      sessionController.updateLoseState(true);
      gridController.uncoverMines();
      //CustomDialogs().loseDialog();
    } else {
      gridController.updateGrid(caseModel);
    }
  }
}
