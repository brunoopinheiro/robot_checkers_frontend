import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/ui/components/board.dart';
import 'package:flutter_checkers_project/src/ui/components/button3d.dart';
import 'package:flutter_checkers_project/src/ui/components/piece.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  final String player;
  final String humanColor;
  final String robotColor;

  const GameScreen({
    Key? key,
    required this.player,
    required this.humanColor,
    required this.robotColor,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String message = '';

  void _simulatePlayerRobot() async {
    setState(() {
      message = '';
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/gifs/robo.gif',
                width: 90,
                height: 90,
              ),
              Text(
                'Robô está fazendo sua jogada...',
                style: GoogleFonts.getFont('Play',
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18)),
              ),
            ],
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 10));
    Navigator.of(context).pop();

    setState(() {
      message = 'Robô jogou, agora é sua vez';
    });
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'Roxo':
        return Colors.purple;
      case 'Verde':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color humanPieceColor = _getColorFromName(widget.humanColor);
    Color robotPieceColor = _getColorFromName(widget.robotColor);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  message,
                  style: GoogleFonts.getFont('Play',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'ROBÔ',
                        style: GoogleFonts.getFont(
                          'Play',
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                        ),
                      ),
                      Piece(
                        color: robotPieceColor,
                        size: 60.0,
                      ),
                    ],
                  ),
                  const Column(children: [CheckerBoard()]),
                  Column(
                    children: [
                      Text(
                        'HUMANO',
                        style: GoogleFonts.getFont(
                          'Play',
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                        ),
                      ),
                      Piece(
                        color: humanPieceColor,
                        size: 60.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AnimatedButton(
              onPressed: _simulatePlayerRobot,
              child: Text(
                'Vez do Robô',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Play',
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 14, 14, 14))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}