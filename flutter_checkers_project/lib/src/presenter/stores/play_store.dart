import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_form_play.dart';
import 'package:flutter_checkers_project/src/presenter/stores/home_store.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:protobuf/protobuf.dart';
// import 'package:flutter_checkers_project/src/proto/messages.proto';

class PlayStore extends ChangeNotifier {
  GameStore? _gameState;

  GameStore? get gameState => _gameState;

  // Future<void> startGame() async {
  //   final response = await http.get(
  //     Uri.parse('http://192.168.158.157:5000/game/help'),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     print('deu certo');
  //     _gameState = gameState;
  //     notifyListeners();
  //   } else {
  //   }
  // }

  void onStartGame(String playGame) {
    //startGame = playGame;
    notifyListeners();
  }

  void openModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ModalForm();
      },
    );
  }
}

