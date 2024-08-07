import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_player_robot_server.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_winner_state.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_celebration.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_player_robot.dart';
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:provider/provider.dart';

class GameStore with ChangeNotifier {
  String playerPieceColor = 'Verde';
  String robotPieceColor = 'Roxo';
  String startingPlayer = 'Aleatório';
  String message = '';
  Board? board;

  void updatePieceColors(String playerColor, String robotColor) {
    playerPieceColor = playerColor;
    robotPieceColor = robotColor;
    notifyListeners();
  }

  void setStartingPlayer(String player) {
    startingPlayer = player;
    notifyListeners();
  }

  void setPlayerPieceColor(String color) {
    playerPieceColor = color;
    robotPieceColor = color == 'Verde' ? 'Roxo' : 'Verde';
    notifyListeners();
  }

  void updateSelections(String player, String color) {
    setPlayerPieceColor(color);
    setStartingPlayer(player);
    notifyListeners();
  }

   Future<void> simulatePlayerRobot(BuildContext context) async {
    final boardStore = Provider.of<BoardStore>(context, listen: false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ModalPlay();
      },
    );

    try {
      final getPlayerRobotServer = GetPlayerRobotServer();
      final newBoard = await getPlayerRobotServer.indicateRobotPlay().timeout(const Duration(seconds: 30));

      boardStore.updateBoard(newBoard);

      final getWinner = GetWinnerStatus();
      final response = await getWinner.checkWinner();

      if (response.statusCode == 204) {
      } else if (response.statusCode == 404) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ModalCelebration(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao processar a jogada')),
      );
    } finally {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
