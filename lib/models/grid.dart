import 'dart:math';
import 'package:get/get.dart';
import 'package:demineur/models/case.dart';

class Grid {
  int _row;

  int get row => _row;

  set row(int value) {
    _row = value;
  }

  int _col;

  int get col => _col;

  set col(int value) {
    _col = value;
  }

  List<CaseModel> cases = [];
  GridController gridController = Get.put(GridController());

  Grid(
    this._col,
    this._row,
  );

//Case list creation with random mined cases
  List<CaseModel> Casecreation() {
    int caseNumbers = col * row;
    int minesNumber = caseNumbers ~/ 3;
    //List<CaseModel> casesl = [];
    List<int> minedIndex = [];
    int i = 0, j = 0;
    //iteration to create 1/3 mines at random positions
    for (i = 0; i < minesNumber; i++) {
      minedIndex.add(Random().nextInt(caseNumbers));
    }
    //iteration to add cases to the grid
    for (j = 0; j < caseNumbers; j++) {
      int x = j ~/ col;
      int y = j % col;
      //verified if the index is among mined indexes
      //and set the case as mined
      if (minedIndex.contains(j)) {
        cases.add(CaseModel(j, x, y, true, false, this));
      } else {
        cases.add(CaseModel(j, x, y, false, false, this));
      }
    }
    return cases;
  }

  void uncovercase(CaseModel caseModel) {
    if (!caseModel.isMined) {
      caseModel.unCovered = true;
      gridController.updateCase(caseModel.index, caseModel);
    } else
      return;
  }

  void unCoverCases(CaseModel caseModel) {
    if (!caseModel.isMined) {
      uncovercase(caseModel);
      uncovercase(cases[caseModel.index + 1]);
      uncovercase(cases[caseModel.index - 1]);
      uncovercase(cases[caseModel.index - col]);
      uncovercase(cases[caseModel.index + (col + 1)]);
      uncovercase(cases[caseModel.index + (col - 1)]);
      uncovercase(cases[caseModel.index - (col - 1)]);
      uncovercase(cases[caseModel.index - (col + 1)]);
    }
  }
}

class GridController extends GetxController {
  var casesController = <CaseModel>[].obs;
  void addCase(CaseModel caseModel) {
    casesController.add(caseModel);
  }

  void updateCase(int id, CaseModel caseModel) {
    casesController[id] = caseModel;
  }
}
