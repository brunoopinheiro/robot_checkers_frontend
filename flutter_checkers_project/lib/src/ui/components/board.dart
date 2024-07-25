import 'package:flutter/material.dart';

class CheckerBoardApp extends StatelessWidget {
  const CheckerBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Jogo de Damas')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CheckerBoard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckerBoard extends StatelessWidget {
  const CheckerBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: _buildGridItems,
        itemCount: 64,
      ),
    );
  }

  Widget _buildGridItems(BuildContext context, int index) {
    final int row = index ~/ 8;
    final int column = index % 8;
    final bool isWhiteSquare =
        (row % 2 == 0 && column % 2 == 1) || (row % 2 == 1 && column % 2 == 0);

    final Color squareColor = isWhiteSquare
        ? const Color.fromARGB(255, 219, 219, 219)
        : const Color.fromARGB(255, 32, 32, 32);

    bool isQueenPiece = isWhiteSquare && (row < 3 || row > 4);

    Color pieceColor = Colors.transparent;
    if (isQueenPiece) {
      if (row < 3) {
        pieceColor = Colors.purple; 
      } else {
        pieceColor = const Color.fromARGB(
            255, 22, 122, 25); 
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: squareColor,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4.0, 4.0),
            blurRadius: 2.0,
          ),
        ], 
      ),
      child: isQueenPiece
          ? Center(
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: pieceColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                  child: Center(
                    child: InkWell(
                      child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: pieceColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Click');
                    },
                  )
                ),
              ),
            )
          : null,
    );
  }
}