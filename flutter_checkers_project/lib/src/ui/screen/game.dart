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
              ElevatedButton(onPressed: (){},
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
