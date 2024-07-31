import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/board.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/title.dart';
import 'package:flutter_checkers_project/src/presenter/stores/play_store.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreen();
}

class _PlayScreen extends State<PlayScreen> {
  final PlayStore _playStore = PlayStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CheckerBoard(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Column(
                        children: [
                          RetroTitle(),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          AnimatedButton(
                            height: 50,
                            width: 140,
                            onPressed: () {
                              _playStore.onStartGame('play');
                              _playStore.openModal(context);
                            },
                            child: Text(
                              'Play',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Black Ops One',
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

