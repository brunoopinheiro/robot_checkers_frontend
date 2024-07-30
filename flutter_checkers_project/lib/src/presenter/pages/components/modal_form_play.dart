import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart';
import 'package:flutter_checkers_project/src/presenter/pages/game.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModalForm();
  }
}

class ModalForm extends StatefulWidget {
  const ModalForm({super.key});

  @override
  State<ModalForm> createState() => _ModalForm();
}

class _ModalForm extends State<ModalForm>{
  Color pieceColorPurple = Colors.purple;
  Color pieceColorGreen = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AlertDialog(
          backgroundColor: Color.fromARGB(55, 151, 151, 151),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Menu', style: GoogleFonts.getFont('Black Ops One', fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),),
            ],
          ),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                    children: [
                    Text('CHECKER COLOR', style: GoogleFonts.getFont('Black Ops One', color: Color.fromARGB(255, 255, 255, 255)), ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Piece(size: 35, color: Color.fromARGB(255, 162, 0, 255)),
                              Piece(size: 35, color: Color.fromARGB(255, 0, 141, 63)),
                            ],
                          ),
                        )
                      ]
                    )
                  ),
                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Column(
                      children: [ 
                        Text('PLAYER', style: GoogleFonts.getFont('Black Ops One', color: Color.fromARGB(255, 255, 255, 255))),
                        Container(
                          margin:  const EdgeInsets.fromLTRB(0, 20, 0, 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/images/robot_avatar.png', width: 80, height: 80, ),
                              const SizedBox(width: 40,),
                              Image.asset('assets/images/human_avatar.png', width: 80, height: 80,),
                              const SizedBox(width: 40,),
                              Image.asset('assets/images/dado.png', width: 80, height: 80,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GameScreen()),
                      );
                    },
                    height: 40,
                    width: 120,
                    child: Text('Start', 
                    style: GoogleFonts.getFont('Play',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 14, 14, 14))),
                    ),
                  )
                ],
              ),
            )
          ]
      ),),
    );
  }
}
