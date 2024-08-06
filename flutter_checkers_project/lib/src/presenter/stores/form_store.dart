import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_play_server.dart';
import 'package:flutter_checkers_project/src/presenter/pages/game.dart';

class FormStore {
  String selectedPlayer = 'Humano';
  String selectedColor = 'Verde';
  String opponentColor = 'Roxo';

  void setSelectedPlayer(String player) {
    selectedPlayer = player;
  }

  void setSelectedColor(String color) {
    selectedColor = color;
    opponentColor = color == 'Verde' ? 'Roxo' : 'Verde';
  }

  void setSelectedPlayerWithRandom() {
    final random = Random();
    selectedPlayer = random.nextBool() ? 'Humano' : 'Robô';
  }

  Future<int> startGame(BuildContext context) async {
    if (selectedPlayer == 'Aleatório') {
      setSelectedPlayerWithRandom();
    }

    int player = selectedPlayer == 'Humano' ? 1 : 2;
    final getNamesServer = GetNamesServer();
    int status =
        await getNamesServer.getStart(player, selectedColor, opponentColor);

    if (status == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => GameScreen(
            playerPieceColor: selectedColor,
            robotPieceColor: opponentColor,
            startingPlayer: selectedPlayer,
            pieceColor: selectedColor, 
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao iniciar o jogo')),
      );
    }

    return status;
  }
}
