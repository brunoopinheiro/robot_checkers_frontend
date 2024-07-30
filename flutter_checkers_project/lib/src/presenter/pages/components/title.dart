import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RetroTitle extends StatelessWidget {
  const RetroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text('CHECKERS DELUX',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Black Ops One',
            textStyle: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 216, 216, 216),
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 0.0,
                  color: Color.fromARGB(255, 112, 112, 112),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}