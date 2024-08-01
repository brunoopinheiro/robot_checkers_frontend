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
    setStartingPlayer(player);
    setPlayerPieceColor(color);
  }

  void simulatePlayerRobot(BuildContext context) {
    // Simulate the robot's move
    message = 'Robô fez um movimento!';
    notifyListeners();
  }
}
