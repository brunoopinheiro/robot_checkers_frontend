import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/game.dart';
import 'package:flutter_checkers_project/src/presenter/components/button3d.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_checkers_project/src/presenter/components/title.dart';

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
      String humanColor = _selectedColor!;
      String robotColor = humanColor == 'Roxo' ? 'Verde' : 'Roxo';

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(
            player: player,
            humanColor: humanColor,
            robotColor: robotColor,
          ),
        ),
      );
    } else {
    }
  }

  // void _showDialog() async {
  //   setState(() {
  //   });

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
    
  //       return AlertDialog(
  //         content: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //                 child: Text(
  //                   'Escolha a cor das peças:',
  //                   style: GoogleFonts.getFont('Play', color: Color.fromARGB(255, 255, 255, 255), fontSize: 18, fontWeight: FontWeight.w700),
  //                 ),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () => _onColorSelected('Roxa'),
  //                     style: ButtonStyle(
  //                       backgroundColor:
  //                           WidgetStateProperty.all<Color>(Colors.purple),
  //                     ),
  //                     child: const Text(
  //                       'Roxo',
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                   ElevatedButton(
  //                     onPressed: () => _onColorSelected('Verde'),
  //                     style: ButtonStyle(
  //                       backgroundColor:
  //                           WidgetStateProperty.all<Color>(Colors.green),
  //                     ),
  //                     child: const Text(
  //                       'Verde',
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //           ],
  //         ),
  //       );
  //     },
  //   );

  //   await Future.delayed(const Duration(seconds: 10));
  //   Navigator.of(context).pop();

  //   setState(() {
  //   });
  // }


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
                  child: const RetroTitle()
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const CheckerBoard(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _onColorSelected('Roxo'),
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
                    if (_selectedColor != null) {
                      _startGame(_selectedPlayer!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, selecione uma cor.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Robô',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Play',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                AnimatedButton(
                  onPressed: () {
                    _selectedPlayer = 'Humano';
                    if (_selectedColor != null) {
                      _startGame(_selectedPlayer!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, selecione uma cor.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Humano',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Play',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                AnimatedButton(
                  onPressed: () {
                    final player =
                        ['Robô', 'Humano'][DateTime.now().second % 2];
                    final color = ['Roxo', 'Verde'][DateTime.now().second % 2];
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
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}


