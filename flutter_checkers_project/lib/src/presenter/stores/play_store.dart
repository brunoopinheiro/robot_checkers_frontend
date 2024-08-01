import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_form_play.dart';

class PlayStore {

  void openForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ModalForm();
      },
    );
  }
}