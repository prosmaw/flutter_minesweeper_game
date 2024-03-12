import 'dart:math';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class RoundedButton extends StatelessWidget {
  final IconData iconButton;
  const RoundedButton({
    super.key,
    required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 28, 37),
              Color.fromARGB(255, 102, 182, 225),
            ],
            transform: GradientRotation(-pi / 2),
          ),
          border: Border.all(
              color: Color.fromARGB(255, 82, 191, 221),
              width: 0.5,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(180),
          boxShadow: [
            //inside boxshadow near the border
            BoxShadow(
                color: Color.fromARGB(255, 46, 91, 118),
                offset: Offset(-1, -1),
                blurRadius: 4,
                inset: true),
            BoxShadow(
                color: Color.fromARGB(255, 46, 91, 118),
                offset: Offset(1, 1),
                blurRadius: 4,
                inset: true),
            //outside boxshadow
            BoxShadow(
                color: Color.fromARGB(255, 12, 25, 33),
                offset: Offset(6, 6),
                blurRadius: 6,
                inset: false),
          ]),
      child: Icon(
        iconButton,
        color: Colors.white,
        size: 70,
      ),
    );
  }
}
