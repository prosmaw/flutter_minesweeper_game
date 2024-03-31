import 'package:demineur/models/case.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';

import 'package:demineur/views/screens/game_page.dart';
import 'package:demineur/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Casewidget extends StatefulWidget {
  CaseModel caseModel;
  Casewidget({super.key, required this.caseModel});

  @override
  State<Casewidget> createState() => _CasewidgetState();
}

class _CasewidgetState extends State<Casewidget> {
  SessionController sessionController = Get.put(SessionController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("isMined: ${widget.caseModel.isMined}");
        if (!sessionController.session.flagSelected &&
            widget.caseModel.isMined &&
            !widget.caseModel.isFlaged) {
          sessionController.updateLoseState(true);
          sessionController.stopTimer();
          loseDialog();
        } else {
          widget.caseModel.grid.unCoverCases(widget.caseModel);
        }
      },
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: widget.caseModel.unCovered
                  ? BaseColors.darkSecondary
                  : Color.fromARGB(255, 199, 184, 184),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(strokeAlign: BorderSide.strokeAlignOutside)),
          child: widget.caseModel.unCovered //check if unCovered
              ? widget.caseModel.isMined
                  ? SvgPicture.asset(
                      "assets/images/bomb.svg",
                      height: 20,
                      width: 20,
                    )
                  : Center(
                      child: Text(
                        widget.caseModel.nearbyMine,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
              : widget.caseModel.isFlaged
                  ? SvgPicture.asset("assets/images/flagad.svg")
                  : SizedBox()),
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
                      Get.to(() => GamePage());
                    },
                    child: Text("Try again"))
              ],
            );
          });
    }
  }
}
