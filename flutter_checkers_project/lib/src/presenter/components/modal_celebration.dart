import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/components/button3d.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const ModalAlert());

class ModalAlert extends StatelessWidget {
  const ModalAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Dialog(),
        ),
      ),
      color: Color.fromARGB(0, 0, 0, 0),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('GANHADOR: ', style: GoogleFonts.getFont('Play', textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
              Image.asset('assets/gifs/gif_celebration.gif', height: 150, width: 150,),
            ],
          ),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  AnimatedButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('Cancel', 
                    style: GoogleFonts.getFont('Play',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 14, 14, 14))),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

