import 'package:demineur/views/widgets/bottom_rounded.dart';
import 'package:demineur/views/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

double fieldHeigh = 0;
double fieldWidth = 0;
double minesNumber = 0;
double timer = 0;

class _SettingsState extends State<Settings> {
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
            Positioned(
                top: 30,
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                  child: Text(
                    "Custom Game Setup",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                )),
            for (int i = 0; i < 10000; i++)
              Positioned(
                  left: Random().nextDouble() * width,
                  bottom: Random().nextDouble() * (height * 0.75),
                  child: Container(
                    width: 0.5,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  )),
            Positioned(
                top: 100,
                child: Container(
                  width: width - 60,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      CustomSlider(
                        sliderValue: fieldWidth,
                        sliderName: "Minefield Width",
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderValue: fieldHeigh,
                        sliderName: "Minefield Height",
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderValue: minesNumber,
                        sliderName: "Mines",
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderValue: timer,
                        sliderName: "Timer",
                      ),
                    ],
                  ),
                )),
            BottomRoundedRow(
              width: width,
              LeftIcon: Icons.home,
              ontapLeft: () {
                Navigator.pop(context);
              },
              rightIcon: Icons.play_arrow,
            )
          ],
        )),
      ),
    );
  }
}
