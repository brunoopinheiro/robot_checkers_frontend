import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/stores/form_store.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({super.key});

  @override
  _ModalForm createState() => _ModalForm();
}

class _ModalForm extends State<ModalForm> {
  final FormStore _store = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text(
            'MENU',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont('Black Ops One',
                fontSize: 26, color: const Color.fromARGB(255, 198, 198, 198)),
          ),
          backgroundColor: const Color.fromARGB(209, 0, 1, 54),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'QUEM COMEÇA?',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Black Ops One',
                    fontSize: 16,
                    color: const Color.fromARGB(255, 198, 198, 198)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _store.setSelectedPlayer('Humano');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _store.selectedPlayer == 'Humano'
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 3.0,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/human_avatar.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _store.setSelectedPlayer('Robô');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _store.selectedPlayer == 'Robô'
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 3.0,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/robot_avatar.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _store.setSelectedPlayerWithRandom();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _store.selectedPlayer == 'Aleatório'
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 3.0,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/dado.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'COR DA PEÇA',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Black Ops One',
                    fontSize: 16,
                    color: const Color.fromARGB(255, 198, 198, 198)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _store.setSelectedColor('Verde');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _store.selectedColor == 'Verde'
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 3.0,
                        ),
                      ),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _store.setSelectedColor('Roxo');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _store.selectedColor == 'Roxo'
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 3.0,
                        ),
                      ),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (_store.selectedPlayer != 'Aleatório')
                Text(
                  '${_store.selectedPlayer} começará o jogo',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Play',
                      fontSize: 18,
                      color: const Color.fromARGB(255, 198, 198, 198)),
                ),
              const SizedBox(height: 30),
            ],
          ),
          actions: [
            Center(
              child: AnimatedButton(
                width: 100,
                height: 40,
                color: Colors.blue,
                onPressed: () async {
                  await _store.startGame(context);
                },
                child: Text(
                  'Start',
                  style: GoogleFonts.getFont('Play',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
