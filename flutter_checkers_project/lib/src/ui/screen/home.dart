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
                  height: 100, 
                  width: 250,
                  child: Text(
                    'Checkers Game', 
                    textAlign: TextAlign.center, 
                    style: GoogleFonts.getFont(
                      'Press Start 2P', 
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 212, 212, 212)
                    ))
                    ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const CheckerBoard(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Escolha a cor das peças:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _onColorSelected('Roxa'),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.purple),
                      ),
                      child: const Text(
                        'Roxo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _onColorSelected('Verde'),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.green),
                      ),
                      child: const Text(
                        'Verde',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
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
                     child: Text(
                      'Robô', 
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
                    AnimatedButton(
                      onPressed: (){
                        _selectedPlayer = 'Humano';
                        _startGame(_selectedPlayer!);
                      }, 
                      child: Text(
                      'Humano', 
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
                    AnimatedButton(
                       onPressed: () {
                        final player =
                            ['Robô', 'Humano'][DateTime.now().second % 2];
                        final color =
                            ['Roxo', 'Verde'][DateTime.now().second % 2];
                        _onColorSelected(color);
                        _startGame(player);
                      },
                      child: Text(
                      'Aleatório', 
                      textAlign: TextAlign.center, 
                      style: GoogleFonts.getFont(
                        'Play', 
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 14, 14, 14)
                      ))
                    ),
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
