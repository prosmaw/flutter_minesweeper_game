import 'dart:async';

import 'package:demineur/models/case.dart';
import 'package:demineur/models/grid.dart';
import 'package:demineur/views/widgets/custom_dialogs.dart';
import 'package:get/get.dart';

class GridController extends GetxController {
  var _grid = Grid(16, 16, 40).obs;

  Grid get grid => _grid.value;

  set grid(value) {
    _grid = value;
  }

  @override
  void onInit() {
    super.onInit();
    _grid.update((val) {
      val!.Casecreation();
    });
    update();
  }

  void reload() {
    grid = Grid(16, 16, 40).obs;
    grid.Casecreation();
    print("has first touch:${grid.hasFirstTouch}");
    update();
  }

  void uncoverMines() async {
    int i = 0;
    Timer.periodic(Duration(milliseconds: 15), (timer) {
      if (grid.cases[i].isMined) {
        grid.uncovercase(grid.cases[i]);
        update();
      }
      if (i < grid.cases.length - 1) {
        i++;
      } else {
        timer.cancel();
        CustomDialogs().loseDialog();
        return;
      }
    });
  }

  void updateGrid(CaseModel caseModel) {
    _grid.update((val) {
      val!.unCoverCases(caseModel);
    });
    update();
  }

  void updateCase(int id, CaseModel caseModel) {
    //cases[id] = caseModel;
    _grid.update((val) {
      val!.cases[id] = caseModel;
    });
    update();
  }
}
