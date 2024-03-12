import 'package:demineur/views/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class BottomRoundedRow extends StatelessWidget {
  const BottomRoundedRow({
    super.key,
    required this.width,
    required this.LeftIcon,
    required this.rightIcon,
    this.ontapLeft,
    this.ontapRight,
  });

  final double width;
  final IconData LeftIcon;
  final IconData rightIcon;
  final Function()? ontapLeft;
  final Function()? ontapRight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 40,
        child: Container(
          margin: EdgeInsets.only(left: (width * 0.2), right: (width * 0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedButton(
                iconButton: LeftIcon,
                ontap: ontapLeft,
              ),
              SizedBox(
                width: width * 0.2,
              ),
              RoundedButton(iconButton: rightIcon, ontap: ontapRight),
            ],
          ),
        ));
  }
}
