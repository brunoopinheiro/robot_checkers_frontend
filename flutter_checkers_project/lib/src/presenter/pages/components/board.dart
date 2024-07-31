import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart';
//import 'piece.dart';

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
    final boardState = BoardStore(); 

    return Container(
      width: 600,
      height: 600,
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItems(context, index, boardState);
        },
        itemCount: 64,
      ),
    );
  }

  Widget _buildGridItems(
      BuildContext context, int index, BoardStore boardState) {
    final int row = index ~/ 8;
    final int column = index % 8;
    final Color squareColor = boardState.getSquareColor(row, column);
    final Color? pieceColor = boardState.getPieceColor(row, column);

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
      child: pieceColor != null
          ? Center(
              child: Piece(
                size: 40,
                color: pieceColor,
              ),
            )
          : null,
    );
  }
}