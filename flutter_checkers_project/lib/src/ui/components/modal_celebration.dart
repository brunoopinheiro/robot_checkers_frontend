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
          content: const Text('Imagem do vitorioso'),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
            )
            )
            
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

