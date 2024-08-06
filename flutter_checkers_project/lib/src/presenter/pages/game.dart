import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart';
import 'package:flutter_checkers_project/src/presenter/stores/game_store.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.playerPieceColor,
    required this.robotPieceColor,
    required this.startingPlayer,
    required this.pieceColor,
  }) : super(key: key);

  final String playerPieceColor;
  final String robotPieceColor;
  final String startingPlayer;
  final String pieceColor;

  @override
  Widget build(BuildContext context) {
    String message = '';
    final GameStore _gameStore = GameStore();

    Color colorFromString(String colorString) {
      switch (colorString) {
        case 'Verde':
          return Colors.green;
        case 'Roxo':
          return Colors.purple;
        default:
          return Colors.black;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (message.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      message,
                      style: GoogleFonts.getFont('Black Ops One',
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 198, 198, 198)),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                              size: 60,
                              color: colorFromString(robotPieceColor),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: CheckerBoard(
                            playerPieceColor: playerPieceColor,
                            robotPieceColor: robotPieceColor,
                          ),
                        ),
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
                              size: 60,
                              color: colorFromString(playerPieceColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedButton(
                  onPressed: () {
                    _gameStore.simulatePlayerRobot(context);
                  },
                  height: 50,
                  width: 180,
                  color: Colors.blue,
                  child: Text(
                    'Vez do Robô',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Play',
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
