import 'package:demineur/controllers/grid_controller.dart';
import 'package:demineur/controllers/session_controller.dart';
import 'package:demineur/utils/colors.dart';
import 'package:demineur/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  SessionController sessionController = Get.find<SessionController>();
  GridController gridController = Get.find<GridController>();
  void winDialog() {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text("You Win"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/gif/win_animation.gif",
                height: 100,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.off(() => HomeScreen());
                },
                child: Text("Home")),
            TextButton(
                onPressed: () {
                  sessionController.reload();
                  gridController.reload();
                  Get.back();
                },
                child: Text("Try again"))
          ],
        ));
  }

  void loseDialog() {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text(
            "Game Over",
            style: TextStyle(color: BaseColors.darkSecondary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/gif/explosion.gif",
                height: 200,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.off(() => HomeScreen());
                },
                child: Text("Home")),
            TextButton(
                onPressed: () {
                  sessionController.reload();
                  gridController.reload();
                  Get.back();
                },
                child: Text("Try again"))
          ],
        ));
  }
}
