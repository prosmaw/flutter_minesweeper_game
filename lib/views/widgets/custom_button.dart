import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.buttonText,
  });

  final double width;
  final String buttonText;

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
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(32),
          color: Color.fromARGB(255, 82, 191, 221),
          boxShadow: [
            //inside box shadow
            BoxShadow(
                color: Color.fromARGB(255, 82, 191, 221),
                offset: Offset(-30, -30),
                blurRadius: 50,
                inset: true),
            BoxShadow(
                color: Color.fromARGB(255, 45, 139, 163),
                offset: Offset(30, 30),
                blurRadius: 30,
                inset: true),
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
                color: Color.fromARGB(255, 46, 91, 118),
                offset: Offset(4, 4),
                blurRadius: 4,
                inset: false),
          ]),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
