import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: GameScreen(),
      )
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreen();

}


class _GameScreen extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        color: const Color.fromARGB(55, 55, 55, 55),
                      ),
                      const Text('Peças: XX')
                    ]
                  ),
                  Column(
                    children: [
                      Container(
                        width: 400,
                        height: 400,
                        color: const Color.fromARGB(55, 55, 55, 55),
                      ),
                      ElevatedButton(onPressed: (){}, child: const Text('Vez do Robo'))
                    ]
                  ),
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        color: const Color.fromARGB(55, 55, 55, 55),
                      ),
                      const Text('Peças: XX')
                    ]
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
  
}
