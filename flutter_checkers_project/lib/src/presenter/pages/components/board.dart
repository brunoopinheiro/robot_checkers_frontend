import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart' as proto;
import 'package:flutter_checkers_project/src/presenter/pages/components/piece_checker.dart'
    as component;
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart'; // Importa o Piece
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';

class CheckerBoard extends StatefulWidget {
  final String playerPieceColor;
  final String robotPieceColor;

  const CheckerBoard({
    super.key,
    required this.playerPieceColor,
    required this.robotPieceColor,
  });

  @override
  _CheckerBoardState createState() => _CheckerBoardState();
}

class _CheckerBoardState extends State<CheckerBoard> {
  late final BoardStore boardStore;
  late Future<proto.Board> futureBoardState;

  @override
  void initState() {
    super.initState();
    boardStore = BoardStore();
    futureBoardState = boardStore.fetchBoardState();
    //indicatePlayRobot() com o novo estado do tabuleiro 
  }

  // void _reload() {
  //   setState(() {
  //     futureBoardState = boardStore.fetchBoardState();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<proto.Board>(
      future: boardStore.fetchBoardState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else {
          final board = snapshot.data;
          return board != null
              ? _buildDynamicBoard(board)
              : const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildDynamicBoard(proto.Board board) {
    return Container(
      width: 600,
      height: 600,
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          final int row = index ~/ 8;
          final int column = index % 8;
          final proto.Square square = board.rows[row].squares[column];
          final Color squareColor = boardStore.getSquareColor(row, column);
          final proto.Piece? piece =
              square.hasContent() ? square.content : null;

          Color pieceColor = Colors.transparent;
          bool isQueen = false;
          if (piece != null) {
            pieceColor = boardStore.getPieceColor(
              piece,
              widget.playerPieceColor,
              widget.robotPieceColor,
            );
            isQueen = boardStore.isQueen(piece);
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
            child: piece != null
                ? Center(
                    child: isQueen
                        ? component.PieceCheckers(
                            color: pieceColor,
                            size: 45,
                            isQueen: isQueen,
                          )
                        : Piece(
                            color: pieceColor,
                            size: 45,
                          ),
                  )
                : const SizedBox.shrink(),
          );
        },
        itemCount: 64,
      ),
    );
  }
}
