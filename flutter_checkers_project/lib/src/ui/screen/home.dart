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
                  color: const Color.fromARGB(55, 55, 55, 55), 
                  height: 35, 
                  width: 250,
                  child: const Text('Título do Aplicativo', textAlign: TextAlign.center),
                ),
                Container(
                  color: const Color.fromARGB(55, 55, 55, 55), 
                  height: 400, 
                  width: 600, 
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text('Robô')),
                    ElevatedButton(onPressed: (){}, child: const Text('Humano')),
                    ElevatedButton(onPressed: (){}, child: const Text('Aleatorio'))
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
