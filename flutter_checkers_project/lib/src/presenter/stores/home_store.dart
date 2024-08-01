import 'package:flutter/material.dart';

class GameStore with ChangeNotifier {
  String playerPieceColor = 'Verde';
  String robotPieceColor = 'Roxo';
  String startingPlayer = 'Aleatório';
  String message = '';

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
    message = 'Robô fez um movimento!';
    notifyListeners();
  }

  String getRandomStartingPlayer() {
    return (DateTime.now().millisecondsSinceEpoch % 2 == 0) ? 'Humano' : 'Robô';
  }
}
