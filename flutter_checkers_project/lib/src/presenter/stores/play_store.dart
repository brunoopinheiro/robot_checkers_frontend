import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_form_play.dart';

class PlayStore {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  void initAnimation(TickerProvider vsync) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat(reverse: true);
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  Animation<double> get scaleAnimation => _scaleAnimation;

  void disposeAnimation() {
    _animationController.dispose();
  }

  void openForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ModalForm();
      },
    );
  }
}
