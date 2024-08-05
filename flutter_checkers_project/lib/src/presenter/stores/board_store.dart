import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_board_state.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';

class BoardStore {
  final int rows;
  final int columns;
  final double pieceSize;
  final GetStateServer _getStateServer;

  BoardStore({
    this.rows = 8,
    this.columns = 8,
    this.pieceSize = 45,
    GetStateServer? getStateServer,
  }) : _getStateServer = getStateServer ?? GetStateServer();

  bool isWhiteSquare(int row, int column) {
    return (row % 2 == 0 && column % 2 == 1) ||
        (row % 2 == 1 && column % 2 == 0);
  }

  Color getSquareColor(int row, int column) {
    return isWhiteSquare(row, column)
        ? const Color.fromARGB(255, 32, 32, 32)
        : const Color.fromARGB(255, 219, 219, 219);
  }

  Color? getPieceColor(int row, int column) {
    if (isWhiteSquare(row, column) && (row < 3 || row > 4)) {
      return row < 3 ? Colors.purple : const Color.fromARGB(255, 22, 122, 25);
    }
    return null;
  }

  Future<Board> fetchBoardState() async {
    return _getStateServer.fetchBoardState();
  }

  Future<void> simulatePlayerRobot(BuildContext context) async {
  try {
    await fetchBoardState();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro ao simular jogada do robô')),
    );
  }
}
}
