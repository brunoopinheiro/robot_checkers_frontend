import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({super.key});

  @override
  State<ModalForm> createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 4, 4, 22),
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
                    fontSize: 18, color: Color.fromARGB(255, 255, 255, 255))),
          ),
        ],
      ),
    );
  }
}
