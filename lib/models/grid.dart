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

  int indexFromPosition(int x, int y) {
    int id = cases.indexWhere((element) => element.x == x && element.y == y);
    return id;
  }

  List<int> checkId(List<int> nbl, int i) {
    if (i > -1) {
      nbl.add(i);
    } else
      return nbl;
    return nbl;
  }

  List<int> nearbyCases(int x, int y) {
    List<int> nearbyList = [];
    int leftid = indexFromPosition((x - 1), y);
    checkId(nearbyList, leftid);
    int rightid = indexFromPosition((x + 1), y);
    checkId(nearbyList, rightid);
    int bottomLid = indexFromPosition((x - 1), (y - 1));
    checkId(nearbyList, bottomLid);
    int bottomRid = indexFromPosition((x + 1), (y - 1));
    checkId(nearbyList, bottomRid);
    int bottom = indexFromPosition(x, (y - 1));
    checkId(nearbyList, bottom);
    int topLid = indexFromPosition((x - 1), (y + 1));
    checkId(nearbyList, topLid);
    int topid = indexFromPosition(x, (y + 1));
    checkId(nearbyList, topid);
    int topRid = indexFromPosition((x + 1), (y + 1));
    checkId(nearbyList, topRid);
    return nearbyList;
  }

  int nearbyMines(int x, int y) {
    int numberofM = 0;
    List<int> nearbyList = nearbyCases(x, y);
    for (int i = 0; i < nearbyList.length; i++) {
      if (cases[nearbyList[i]].isMined) {
        numberofM += 1;
      }
    }
    return numberofM;
  }

  void uncovercase(int x, int y) {
    int position = indexFromPosition(x, y);
    if (!cases[position].isMined) {
      cases[position].unCovered = true;
      gridController.updateCase(position, cases[position]);
    } else
      return;
  }

  void unCoverCases(CaseModel caseModel) {
    int x = caseModel.x;
    int y = caseModel.y;
    int nByMines = nearbyMines(x, y);
    if (nByMines == 0 && !caseModel.isMined) {
      uncovercase(x, y);
      List<int> nearByCases = nearbyCases(x, y);
      for (int i = 0; i < nearByCases.length; i++) {
        unCoverCases(cases[nearByCases[i]]);
      }
    } else if (nByMines > 0 && !caseModel.isMined) {
      uncovercase(x, y);
      cases[caseModel.index].nearbyMine = nByMines.toString();
      gridController.updateCase(caseModel.index, caseModel);
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
