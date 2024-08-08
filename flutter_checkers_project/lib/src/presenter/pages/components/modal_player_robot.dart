import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalPlay extends StatefulWidget {
  const ModalPlay({super.key});

  @override
  State<ModalPlay> createState() => _ModalPlayRobot();
}

class _ModalPlayRobot extends State<ModalPlay> {
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(246, 202, 202, 202),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/gifs/robo.gif',
            width: 90,
            height: 90,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Robô está fazendo sua jogada...',
            style: GoogleFonts.getFont('Black Ops One',
              textStyle: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 15, 15, 15))),
          ),
        ],
      ),
    );
  }
}
