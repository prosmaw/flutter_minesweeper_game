import 'dart:math';

import 'package:demineur/views/widgets/custom_button.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 30, 72, 110),
              Color.fromARGB(255, 102, 182, 225),
            ],
            transform: GradientRotation(-pi / 2),
          )),
          child: SafeArea(
            child: Stack(
              children: [
                for (int i = 0; i < 10000; i++)
                  Positioned(
                      left: Random().nextDouble() * width,
                      bottom: Random().nextDouble() * (height * 0.5),
                      child: Container(
                        width: 0.2,
                        height: 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      )),
                Image.asset(
                  "assets/images/logo.png",
                ),
                Positioned(
                    top: height * 0.3,
                    left: width * 0.25,
                    right: width * 0.25,
                    child: CustomButton(width: width))
              ],
            ),
          )),
    );
  }
}
