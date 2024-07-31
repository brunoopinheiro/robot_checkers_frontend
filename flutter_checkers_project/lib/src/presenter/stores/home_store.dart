import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_player_robot.dart';

class GameStore extends ChangeNotifier {
  String _message = '';
  Color _playerPieceColor = Colors.green;
  Color _robotPieceColor = Colors.purple;

  String get message => _message;
  Color get playerPieceColor => _playerPieceColor;
  Color get robotPieceColor => _robotPieceColor;

  void setMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }

  Future<void> simulatePlayerRobot(BuildContext context) async {
    setMessage('');

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ModalForm();
      },
    );

    setMessage('Robô jogou, agora é sua vez');
  }

  void updatePieceColors(Color chosenColor) {
    _playerPieceColor = chosenColor;
    _robotPieceColor =
        chosenColor == Colors.green ? Colors.purple : Colors.green;
    notifyListeners();
  }
}
