import 'package:demineur/views/widgets/bottom_rounded.dart';
import 'package:demineur/views/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:demineur/utils/routes.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

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
            // Stack(
            //   children: List.generate(
            //     10000,
            //     (index) => Positioned(
            //         left: Random().nextDouble() * width,
            //         bottom: Random().nextDouble() * (height * 0.75),
            //         child: Container(
            //           width: 0.5,
            //           height: 0.5,
            //           decoration: BoxDecoration(
            //             color: Colors.grey,
            //             border: Border.all(color: Colors.grey, width: 1.0),
            //             borderRadius: BorderRadius.circular(2.5),
            //           ),
            //         )),
            //   ),
            // ),
            Positioned(
                top: 100,
                child: Container(
                  width: width - 60,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      CustomSlider(
                        sliderName: "Minefield Width",
                        width: width,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderName: "Minefield Height",
                        width: width,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderName: "Mines",
                        width: width,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomSlider(
                        sliderName: "Timer",
                        width: width,
                      ),
                    ],
                  ),
                )),
            BottomRoundedRow(
              width: width,
              LeftIcon: Icons.home,
              ontapLeft: () {
                Get.back();
              },
              rightIcon: Icons.play_arrow,
              ontapRight: () {
                Get.toNamed(Routes.GamePage);
              },
            )
          ],
        )),
      ),
    );
  }
}
