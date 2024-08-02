import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_player_robot_server.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_board_state.dart';
class GameStore with ChangeNotifier {
  String playerPieceColor = 'Verde';
  String robotPieceColor = 'Roxo';
  String startingPlayer = 'Aleatório';
  String message = '';
  
  get http => null;

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
  }

  void simulatePlayerRobot(BuildContext context) {

    Future<Board> startGame(BuildContext context) async {
    final getStateBoard = GetStateServer();
    Board status =
        await getStateBoard.fetchBoardState();

    if (status == 200) {
      //atualiza_tabuleiro()
      Future<Board> startGame(BuildContext context) async {

          final getBoardServer = BoardState();
          Board status =
              await getBoardServer.fetchBoardState();

          if (status == 200) {
            print('ok 2');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Erro ao iniciar o jogo')),
            );
          }

          return status;
        }
      print('ok');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao iniciar o jogo')),
      );
    }

    return status;
  }
  }

  String getRandomStartingPlayer() {
    return (DateTime.now().millisecondsSinceEpoch % 2 == 0) ? 'Humano' : 'Robô';
  }
}
