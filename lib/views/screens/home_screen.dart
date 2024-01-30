import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
