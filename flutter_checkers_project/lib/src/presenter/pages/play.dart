import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/static_board.dart'; // Atualize o caminho do import se necessário
import 'package:flutter_checkers_project/src/presenter/pages/components/button3d.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/title.dart';
import 'package:flutter_checkers_project/src/presenter/stores/play_store.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen>
    with SingleTickerProviderStateMixin {
  late PlayStore _playStore;

  @override
  void initState() {
    super.initState();
    _playStore = PlayStore();
    _playStore.initAnimation(this);
  }

  @override
  void dispose() {
    _playStore.disposeAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _playStore.scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _playStore.scaleAnimation.value,
                    child: const StaticBoard(), 
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 850,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(239, 1, 10, 34),
                    border: Border.all(
                      color: const Color.fromARGB(155, 0, 75, 236),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RetroTitle(),
                        const SizedBox(height: 10),
                        AnimatedButton(
                          height: 50,
                          width: 140,
                          color: Colors.blue,
                          onPressed: () {
                            _playStore.openForm(context);
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
