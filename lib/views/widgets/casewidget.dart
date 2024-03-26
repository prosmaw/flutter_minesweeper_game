import 'package:demineur/models/case.dart';
import 'package:demineur/models/session.dart';
import 'package:demineur/utils/colors.dart';
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
          loseDialog();
        } else {
          widget.caseModel.grid.unCoverCases(widget.caseModel);
        }
      },
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color:
                  widget.caseModel.grid.cases[widget.caseModel.index].unCovered
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
                  : Text(
                      widget.caseModel.nearbyMine,
                      style: TextStyle(color: Colors.white),
                    )
              : widget.caseModel.isFlaged
                  ? SvgPicture.asset("assets/images/flagad.svg")
                  : SizedBox()),
    );
  }

  void loseDialog() {
    print("Lose dialog");
    if (sessionController.session.lose) {
      print("Game lose state:${sessionController.session.lose}");
      showAdaptiveDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Game Over"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/gif/explosion.gif",
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
}
