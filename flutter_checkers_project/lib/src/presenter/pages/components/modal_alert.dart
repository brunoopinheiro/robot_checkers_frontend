import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';

class ModalAlert extends StatelessWidget {
  const ModalAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      insetPadding: const EdgeInsets.all(60),
      backgroundColor: const Color.fromARGB(
        209,
        0,
        1,
        54,
      ),
      content: Text(
        'NÃO EXISTEM MAIS DAMAS',
        style: GoogleFonts.getFont('Black Ops One',
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),
      actions: <Widget>[
        Center(
          child: Column(
            children: [
              AnimatedButton(
                onPressed: () => Navigator.pop(context),
                height: 40,
                width: 120,
                color: Colors.blue,
                child: Text(
                  'Cancel',
                  style: GoogleFonts.getFont(
                    'Play',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
