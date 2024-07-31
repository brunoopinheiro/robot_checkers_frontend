import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_form_play.dart';

class PlayStore extends ChangeNotifier {
  String? startGame;

  void onStartGame(String playGame) {
    startGame = playGame;
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
