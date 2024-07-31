import 'package:flutter/material.dart';

class BoardStore {
  final int rows;
  final int columns;
  final double pieceSize;

  BoardStore({
    this.rows = 8,
    this.columns = 8,
    this.pieceSize = 45,
  });

  bool isWhiteSquare(int row, int column) {
    return (row % 2 == 0 && column % 2 == 1) ||
        (row % 2 == 1 && column % 2 == 0);
  }

  Color getSquareColor(int row, int column) {
    return isWhiteSquare(row, column)
        ? const Color.fromARGB(255, 219, 219, 219)
        : const Color.fromARGB(255, 32, 32, 32);
  }

  Color? getPieceColor(int row, int column) {
    if (isWhiteSquare(row, column) && (row < 3 || row > 4)) {
      return row < 3 ? Colors.purple : const Color.fromARGB(255, 22, 122, 25);
    }
    return null;
  }
}
