import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/game.dart';
import 'package:flutter_checkers_project/src/presenter/stores/form_store.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({super.key});

  @override
  State<ModalForm> createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  final ModalFormStore _store = ModalFormStore();
  Color? _selectedPieceColor;
  String? _selectedPlayer;
  String? _startPlayerLabel;

  @override
  Widget build(BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 0, 10, 38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Menu',
                style: GoogleFonts.getFont(
                  'Black Ops One',
                  fontSize: 30,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // Selecione quem começa
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                child: Column(
                  children: [
                    Text(
                      'PLAYER',
                      style: GoogleFonts.getFont(
                        'Black Ops One',
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPlayerOption('Robô', 'robot',
                              'assets/images/robot_avatar.png'),
                              const SizedBox(width: 40,),
                          _buildPlayerOption('Humano', 'human',
                              'assets/images/human_avatar.png'),
                              const SizedBox(width: 40,),
                          _buildPlayerOption(
                              'Aleatório', 'random', 'assets/images/dado.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedPlayer != 'random')
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: Column(children: [
                    Text(
                      'PLAYER',
                      style: GoogleFonts.getFont(
                        'Black Ops One',
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildPieceOption(Colors.purple),
                          _buildPieceOption(Colors.green),
                        ],
                      )
                  ],)
                ),
              if (_selectedPlayer == 'random') _buildPieceOptionsWithResult(),
              if (_startPlayerLabel != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _startPlayerLabel!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              AnimatedButton(
                height: 40,
                width: 120,
                color: Colors.blue,
                onPressed: () {
                  if (_selectedPieceColor != null && _selectedPlayer != null) {
                    _store.setPieceColor(_selectedPieceColor!);
                    _store.setStartPlayer(_selectedPlayer!);
                    _store.confirmSelection();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(store: _store),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Por favor, escolha uma cor e quem começa.')),
                    );
                  }
                },
                child: Text(
                  'Start',
                  style: GoogleFonts.getFont('Play',
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 14, 14, 14))),
                ),
              )
            ],
          ),
    );
  }

  Widget _buildPieceOption(Color color) {
    final isSelected = _selectedPieceColor == color;
    return GestureDetector(
      onTap: _selectedPlayer == 'random'
          ? null
          : () {
              setState(() {
                _selectedPieceColor = color;
              });
            },
      child: Container(
        decoration: BoxDecoration(
          border:
              isSelected ? Border.all(color: Colors.yellow, width: 3) : null,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Piece(
              size: 35,
              color: color,
            ),
            if (_selectedPlayer == 'random')
              Text(
                _startPlayerLabel ?? '',
                style: const TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieceOptionsWithResult() {
    return Column(
      children: [
        _buildPieceOptionWithResult(Colors.purple, 'Rbô'),
        _buildPieceOptionWithResult(Colors.green, 'Humano'),
      ],
    );
  }

  Widget _buildPieceOptionWithResult(Color color, String label) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: _selectedPieceColor == color
              ? Border.all(color: Colors.yellow, width: 3)
              : null,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Piece(
              size: 35,
              color: color,
            ),
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerOption(String label, String player, String imagePath) {
    final isSelected = _selectedPlayer == player;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlayer = player;
          if (player == 'random') {
            _store.setPieceColor(_selectedPieceColor ?? Colors.transparent);
            _store.updateRandomColors();
            _startPlayerLabel =
                _store.startPlayer == 'robot' ? 'Roô' : 'Humano';
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border:
              isSelected ? Border.all(color: Colors.yellow, width: 3) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80, height: 80),
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}