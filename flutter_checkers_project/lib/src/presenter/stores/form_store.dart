import 'dart:async';
import 'dart:math'; 
import 'package:flutter_checkers_project/src/external/datasources/get_play_server.dart';

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

  Future<int> startGame() async {
    if (selectedPlayer == 'Aleatório') {
      setSelectedPlayerWithRandom();
    }
    
    int player = selectedPlayer == 'Humano' ? 1 : 2;
    final getNamesServer = GetNamesServer();
    return await getNamesServer.getStart(player, selectedColor, opponentColor);
  }
}

