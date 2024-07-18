import 'package:flutter/material.dart';

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
              Image.asset('assets/gifs/gif_celebration.gif', height: 100, width: 180,),
              const Text('Mensagem de Vitoria')
            ],
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              )
            )
          ]
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

