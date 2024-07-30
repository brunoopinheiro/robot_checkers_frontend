import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/title.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/modal_form_play.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlayScreen();
  }
}

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreen();
}

class _PlayScreen extends State<PlayScreen> {
  String? _startGame;

  void _onStartGame(String playGame) {
    setState(() {
      _startGame = playGame;
    });
  }

  void _openModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ModalForm();
      },
    );
    print('click');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: const RetroTitle()
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: const CheckerBoard(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedButton(
                    height: 50,
                    width: 140,
                    onPressed: (){
                      _startGame = 'play';
                      _onStartGame(_startGame!);
                      _openModal(context);
                    }, 
                    child: Text(
                    'Play',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Play',
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),)
                ],
              )
            ],
          ),
        )
    );
  }
  
}


