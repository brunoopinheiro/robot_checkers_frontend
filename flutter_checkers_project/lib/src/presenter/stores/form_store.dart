import 'dart:async';
import 'dart:math';  
import 'package:http/http.dart' as http;

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

class GetNamesServer {
  final client = http.Client();

  // função que se comunica com o servidor
  Future<int> getStart(int player, String color1, String color2) async {
    try {
      final uri = Uri.parse('http://192.168.158.157:5000/game/start/$player/$color1/$color2');
      final request = await http.get(uri);
      return request.statusCode;
    } catch (e) {
      print("Problem connecting to the server ${e.toString()}");
    }
    return 500;
  }
}
