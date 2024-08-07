import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart' as proto;

class BoardStore extends ChangeNotifier {
  final int rows;
  final int columns;
  final double pieceSize;

  BoardStore({
    this.rows = 8,
    this.columns = 8,
    this.pieceSize = 45,
  });

  proto.Board _board = proto.Board();

  proto.Board get board => _board;

  void updateBoard(proto.Board newBoard) {
    _board = newBoard;
    notifyListeners();
  }

  bool isWhiteSquare(int row, int column) {
    return (row % 2 == 0 && column % 2 == 1) ||
        (row % 2 == 1 && column % 2 == 0);
  }

  Color getSquareColor(int row, int column) {
    return isWhiteSquare(row, column)
        ? const Color.fromARGB(255, 32, 32, 32)
        : const Color.fromARGB(255, 219, 219, 219);
  }

  Color getPieceColor(
      proto.Piece piece, String playerColor, String robotColor) {
    if (piece.color == 'verde') {
      return playerColor == 'verde' ? Colors.green : Colors.purple;
    } else if (piece.color == 'roxo') {
      return playerColor == 'roxo' ? Colors.purple : Colors.green;
    }
    return Colors.transparent;
  }

  bool isQueen(proto.Piece piece) {
    return piece.type == proto.Piece_Type.QUEEN;
  }
}
