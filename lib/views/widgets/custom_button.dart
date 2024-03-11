import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(4),
      height: width * 0.15,
      width: width * 0.5,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromARGB(255, 82, 191, 221),
              width: 2,
              strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(32),
          color: Color.fromARGB(255, 82, 191, 221),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 82, 191, 221),
                offset: Offset(-30, -30),
                blurRadius: 50,
                inset: true),
            BoxShadow(
                color: Color.fromARGB(255, 41, 126, 147),
                offset: Offset(30, 30),
                blurRadius: 30,
                inset: true),
            BoxShadow(
                color: Color.fromARGB(255, 46, 91, 118),
                offset: Offset(4, 4),
                blurRadius: 4,
                inset: false),
          ]),
      child: Center(
        child: Text(
          "Classic Mode",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
