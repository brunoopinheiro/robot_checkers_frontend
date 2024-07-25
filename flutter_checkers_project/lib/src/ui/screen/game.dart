import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center()
    );
  }
}

class GameScreen extends StatefulWidget {
  final String player;
  final String color;

  const GameScreen({
    Key? key,
    required this.player,
    required this.color, 
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreen();

}


class _GameScreen extends State<GameScreen> {
  String message = '';

  void _simulatePlayerRobot() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 30,),
              Text('Robô está jogando...')
            ],
          )
        );
      }
    );

    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pop();

    // vou atualizar o tabuleiro aqui
    setState(() {
      message = 'Robô Jogou, agora é sua vez';
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/avatar.jpg', width: 240, height: 240,),
                      const Text('Peças: XX', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),)
                    ]
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/checkers.jpg', width: 400, height: 400,),
                    ]
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/robot_wall.png', width: 220, height: 220,),
                      const Text('Peças: XX', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),)
                    ]
                  )
                ],
              )
            ),
              ElevatedButton(
                onPressed: _simulatePlayerRobot,
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Color.fromARGB(255, 56, 56, 56))
                    )
                  )
                ), 
                child: const Text(
                  'Vez do robô',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 43, 43, 43) // insert your font size here
                    ),
                  ),
              ),
          ],
        ),
      ),
    );
  }
  
}
