import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_player_robot.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  //final String player;
  //final String humanColor;
  //final String robotColor;

  const GameScreen({
    super.key,
    //required this.player,
    //required this.humanColor,
    //required this.robotColor,
  });

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
         return const ModalForm();
      },
    );

    await Future.delayed(const Duration(seconds: 10));
    Navigator.of(context).pop();

    setState(() {
      message = 'Robô jogou, agora é sua vez';
    });
  }

  // Color _getColorFromName(String colorName) {
  //   switch (colorName) {
  //     case 'Roxo':
  //       return Colors.purple;
  //     case 'Verde':
  //       return Colors.green;
  //     default:
  //       return Colors.transparent;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //Color humanPieceColor = _getColorFromName(widget.humanColor);
    //Color robotPieceColor = _getColorFromName(widget.robotColor);

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
                  style: GoogleFonts.getFont('Black Ops One',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 198, 198, 198)),
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
                      // Piece(
                      //   //color: robotPieceColor,
                      //   size: 60.0,
                      // ),
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
                      // Piece(
                      //   //color: humanPieceColor,
                      //   size: 60.0,
                      // )
                    ],
                  ),
                ],
              ),
            ),
            AnimatedButton(
              onPressed: _simulatePlayerRobot,
              height: 55,
              width: 180,
              child: Text(
                'Vez do Robô',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Black Ops One',
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 24, 24, 24))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}