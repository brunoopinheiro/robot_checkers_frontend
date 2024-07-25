import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/ui/components/board.dart';
import 'package:flutter_checkers_project/src/ui/screen/game.dart';
import 'package:flutter_checkers_project/src/ui/components/button3d.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeScreen(),
      )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();

}


class _HomeScreen extends State<HomeScreen> {
  String? _selectedColor;
  String? _selectedPlayer;

  void _onColorSelected(String color) {
    setState(() {
      _selectedColor = color;
    });
  }

   void _startGame(String player) {
    if (_selectedColor != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(
            player: player,
            color: _selectedColor!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione uma cor.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 35, 
                  width: 250,
                  child: Text(
                    'Checkers Game', 
                    textAlign: TextAlign.center, 
                    style: GoogleFonts.getFont(
                    'Play', 
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 212, 212, 212)
                    ))
                    ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: const CheckerBoard(),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedButton(
                      onPressed: () {
                        _selectedPlayer = 'Robô';
                        _startGame(_selectedPlayer!);
                      },
                     child: const Text('Robô', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
                     ),
                    AnimatedButton(
                      onPressed: (){
                        _selectedPlayer = 'Humano';
                        _startGame(_selectedPlayer!);
                      }, 
                      child: const Text('Humano', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    ),
                    AnimatedButton(
                      onPressed: (){
                        _selectedPlayer = 'Aleatorio';
                        _startGame(_selectedPlayer!);
                      },
                      child: const Text('Aleatório', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}
