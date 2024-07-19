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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          insetPadding: const EdgeInsets.all(60),
          content: const Text('Alerta quando não houver damas'),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Color.fromARGB(255, 56, 56, 56))
                          )
                        )
                    ),
                child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 43, 43, 43)),),
            )
            )
            
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
