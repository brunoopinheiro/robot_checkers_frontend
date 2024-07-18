import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeScreen(),
      )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();

}


class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 35, 
                  width: 250,
                  child: const Text('Checkers Game', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child:Image.asset('assets/images/checkers.jpg', width: 400.0, height: 400.0, ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Color.fromARGB(255, 56, 56, 56))
                          )
                        )
                    ), child: const Text(
                      'Robô',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 43, 43, 43) // insert your font size here
                      ),
                    ),
                    ),
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Color.fromARGB(255, 56, 56, 56))
                          )
                        )
                    ), child: const Text(
                      'Humano',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 43, 43, 43) // insert your font size here
                      ),
                    ),
                    ),
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Color.fromARGB(255, 56, 56, 56))
                          )
                        )
                    ), child: const Text(
                      'Aleatório',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 43, 43, 43) // insert your font size here
                      ),
                    ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}
