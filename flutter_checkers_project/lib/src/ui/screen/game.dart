import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/ui/components/board.dart';
import 'package:flutter_checkers_project/src/ui/components/button3d.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center()
    );
  }
}

class GameScreen extends StatefulWidget {
  final String player;
  final String color;

  const GameScreen({
    Key? key,
    required this.player,
    required this.color, 
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreen();

}

class _GameScreen extends State<GameScreen> {
  String message = '';

  void _simulatePlayerRobot() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 30,),
              Text('Robô está jogando...')
            ],
          )
        );
      }
    );

    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pop();

    // vou atualizar o tabuleiro aqui
    setState(() {
      message = 'Robô Jogou, agora é sua vez';
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      //Image.asset('assets/images/avatar.jpg', width: 240, height: 240,),
                      Text(
                        'Peças: ${widget.color}', 
                        style: const TextStyle(
                          fontSize: 17.0, 
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)
                        ),
                      )
                    ]
                  ),
                  const Column(
                    children: [
                      CheckerBoard()
                    ]
                  ),
                  Column(
                    children: [
                      //Image.asset('assets/images/robot_wall.png', width: 220, height: 220,),
                      Text(
                        'Peças: ${widget.color}', 
                        style: 
                        const TextStyle(
                            fontSize: 17.0, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        )
                    ]
                  )
                ],
              )
            ),
            AnimatedButton(
              onPressed: (){}, 
              child: 
                Text(
                  'Vez do Robô', 
                  textAlign: TextAlign.center, 
                  style: GoogleFonts.getFont(
                  'Play', 
                  textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 14, 14, 14)
                ))
              ),
            ),
            if (message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
