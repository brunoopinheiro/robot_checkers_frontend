import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/stores/form_store.dart';
import 'package:flutter_checkers_project/src/presenter/stores/home_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
    required this.store,
  });

  final ModalFormStore store;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameStore()..updatePieceColors(store.pieceColor),
      child: Consumer<GameStore>(
        builder: (context, gameStore, _) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, 
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (gameStore.message.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            gameStore.message,
                            style: GoogleFonts.getFont('Black Ops One',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 198, 198, 198)),
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
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 25,
                                      ),
                                    ),
                                    Piece(
                                      size: 60,
                                      color: gameStore.robotPieceColor,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0), 
                                  child: const CheckerBoard(),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'HUMANO',
                                      style: GoogleFonts.getFont(
                                        'Play',
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 25,
                                      ),
                                    ),
                                    Piece(
                                      size: 60,
                                      color: gameStore.playerPieceColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      AnimatedButton(
                        onPressed: () {
                          gameStore.simulatePlayerRobot(context);
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
        },
      ),
    );
  }
}