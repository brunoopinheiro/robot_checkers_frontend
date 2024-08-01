import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/stores/form_store.dart';

class ModalForm extends StatefulWidget {
  const ModalForm({super.key});

  @override
  _ModalForm createState() => _ModalForm();
}

class _ModalForm extends State<ModalForm> {
  final FormStore _store = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
      title: const Text('Configuração do Jogo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Quem começa?'),
          DropdownButton<String>(
            value: _store.selectedPlayer,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _store.setSelectedPlayer(newValue);
                });
              }
            },
            items: <String>['Humano', 'Robô', 'Aleatório']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text('Cor da peça'),
          DropdownButton<String>(
            value: _store.selectedColor,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _store.setSelectedColor(newValue);
                });
              }
            },
            items: <String>['Verde', 'Roxo']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            int status = await _store.startGame();
            if (status == 200) {
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao iniciar o jogo')),
              );
            }
          },
          child: Text('Start'),
        ),
      ],
      )
    );
  }
}
