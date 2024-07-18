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
                      Image.asset('assets/images/avatar.png', width: 220, height: 220,),
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
                      Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                       child: ElevatedButton(onPressed: (){}, child: const Text('Vez do Robo'))
                      )
                    ]
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/robot.jpg', width: 200, height: 200,),
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
