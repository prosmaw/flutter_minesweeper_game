import 'package:demineur/models/case.dart';
import 'package:demineur/utils/colors.dart';
import 'package:flutter/material.dart';

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
          widget.caseModel.isMined = true;
        });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: widget.caseModel.isMined
                ? BaseColors.darkSecondary
                : Colors.grey,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(strokeAlign: BorderSide.strokeAlignOutside)),
      ),
    );
  }
}
