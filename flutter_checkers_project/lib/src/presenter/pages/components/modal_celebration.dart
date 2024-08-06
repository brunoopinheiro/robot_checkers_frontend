import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalCelebration extends StatelessWidget {
  const ModalCelebration({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: const Color.fromARGB(
        209,
        0,
        1,
        54,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'GANHADOR: ',
            style: GoogleFonts.getFont('Black Ops One',
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255))),
          ),
          Image.asset('assets/gifs/gif_celebration.gif',
              height: 150, width: 150),
        ],
      ),
    );
  }
}
