import 'package:flutter/material.dart';

class SudoNode {
  int value;
  bool isFixed;
  bool isInputMode;
  final int x;
  final int y;
  Color backgroundColor;
  List<int> illegalNum = [];
  List<SudoNode> colNodes;
  List<SudoNode> rowNodes;
  List<SudoNode> groupNodes;

  SudoNode({
    this.x,
    this.y,
    this.value,
    this.backgroundColor,
    this.isInputMode = false,
    this.isFixed = false,
    this.colNodes,
    this.rowNodes,
    this.groupNodes,
  });

  bool get hasConflict {
    bool hasConflict = false;
    if (colNodes
            .where(
              (node) =>
                  !identical(node, this) &&
                  node.value == value &&
                  value != null,
            )
            .toList()
            .length >
        0) {
      hasConflict = true;
    }
    if (rowNodes
            .where(
              (node) =>
                  !identical(node, this) &&
                  node.value == value &&
                  value != null,
            )
            .toList()
            .length >
        0) {
      hasConflict = true;
    }
    if (groupNodes
            .where(
              (node) =>
                  !identical(node, this) &&
                  node.value == value &&
                  value != null,
            )
            .toList()
            .length >
        0) {
      hasConflict = true;
    }
    return hasConflict;
  }

  int get availableNum {
    for (int i = 1; i < 10; i++) {
      if (colNodes.indexWhere((node) => node.value == i) > -1 ||
          rowNodes.indexWhere((node) => node.value == i) > -1 ||
          groupNodes.indexWhere((node) => node.value == i) > -1) {
        continue;
      } else {
        if (illegalNum.contains(i)) {
          continue;
        }
        return i;
      }
    }
    return null;
  }

  @override
  String toString() {
    return 'SudoNode(x: $x, y: $y, value: $value)';
  }
}
