import 'package:demineur/models/case.dart';
import 'package:demineur/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Casewidget extends StatefulWidget {
  CaseModel caseModel;
  Casewidget({super.key, required this.caseModel});

  @override
  State<Casewidget> createState() => _CasewidgetState();
}

class _CasewidgetState extends State<Casewidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.caseModel.grid.unCoverCases(widget.caseModel);
        });
      },
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: widget.caseModel.unCovered
                  ? BaseColors.darkSecondary
                  : Colors.grey,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(strokeAlign: BorderSide.strokeAlignOutside)),
          child: widget.caseModel.unCovered
              ? widget.caseModel.isMined
                  ? SvgPicture.asset(
                      "assets/images/bomb.svg",
                      height: 20,
                      width: 20,
                    )
                  : SizedBox()
              : SizedBox()),
    );
  }
}
