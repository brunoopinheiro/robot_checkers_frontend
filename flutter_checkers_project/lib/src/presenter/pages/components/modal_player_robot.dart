import 'package:flutter/material.dart';
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
          backgroundColor: const Color.fromARGB(55, 151, 151, 151),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/gifs/robo.gif',
                width: 90,
                height: 90,
              ),
              const SizedBox(width: 20,),
              Text(
                'Robô está fazendo sua jogada...',
                style: GoogleFonts.getFont('Black Ops One',
                    textStyle: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255)
                  )),
              ),
            ],
          ),
        )
      ),
    );
  }
}
