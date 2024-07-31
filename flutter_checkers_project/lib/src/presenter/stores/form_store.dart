import 'dart:math';
import 'package:flutter/material.dart';

class ModalFormStore {
  Color pieceColor = Colors.transparent;
  String startPlayer = 'random'; 
  Color robotPieceColor = Colors.transparent;
  Color humanPieceColor = Colors.transparent;

  void setPieceColor(Color color) {
    pieceColor = color;
  }

  void setStartPlayer(String player) {
    startPlayer = player;
  }

  String getRandomStartPlayer() {
    final players = ['robot', 'human'];
    return players[Random().nextInt(players.length)];
  }

  void updateRandomColors() {
    startPlayer = getRandomStartPlayer();
    if (startPlayer == 'robot') {
      robotPieceColor = pieceColor;
      humanPieceColor = pieceColor == Colors.purple ? Colors.green : Colors.purple;
    } else {
      humanPieceColor = pieceColor;
      robotPieceColor = pieceColor == Colors.purple ? Colors.green : Colors.purple;
    }
  }

  void confirmSelection() {
    if (startPlayer == 'random') {
      updateRandomColors();
    } else {
      if (startPlayer == 'robot') {
        robotPieceColor = pieceColor;
        humanPieceColor = pieceColor == Colors.purple ? Colors.green : Colors.purple;
      } else {
        humanPieceColor = pieceColor;
        robotPieceColor = pieceColor == Colors.purple ? Colors.green : Colors.purple;
      }
    }
  }
}
