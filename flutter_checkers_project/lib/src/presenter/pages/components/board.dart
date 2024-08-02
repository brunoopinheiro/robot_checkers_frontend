import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';
import 'package:flutter_checkers_project/src/presenter/pages/components/piece.dart'as component;
import 'package:flutter_checkers_project/src/proto/messages.pb.dart' as proto;
import 'package:flutter_checkers_project/src/external/datasources/get_player_robot_server.dart';

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

class CheckerBoard extends StatefulWidget {
  const CheckerBoard({super.key});

  @override
  _CheckerBoardState createState() => _CheckerBoardState();
}

class _CheckerBoardState extends State<CheckerBoard> {
  final BoardStore boardStore = BoardStore();
  proto.Board? board;
  bool isModalVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  Future<void> _initializeBoard() async {
    setState(() {
      isModalVisible = false;
    });
    try {
      final initialBoard =
          await boardStore.fetchBoardState();
      setState(() {
        board = initialBoard;
      });
    } catch (e) {
      print('Failed to load board state: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        board == null ? _buildStaticBoard() : _buildDynamicBoard(),
        if (isModalVisible) const ModalPlayerRobot(),
      ],
    );
  }

  Widget _buildStaticBoard() {
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
          final Color squareColor = boardStore.getSquareColor(row, column);

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
          );
        },
        itemCount: 64,
      ),
    );
  }

  Widget _buildDynamicBoard() {
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
          final Color squareColor = boardStore.getSquareColor(row, column);
          final proto.Square square = board!.rows[row].squares[column];

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
            child: square.hasContent()
                ? Center(
                    child: component.Piece(
                      size: 40,
                      color: square.content.color == "purple"
                          ? Colors.purple
                          : const Color.fromARGB(255, 22, 122, 25),
                    ),
                  )
                : null,
          );
        },
        itemCount: 64,
      ),
    );
  }
}

class ModalPlayerRobot extends StatelessWidget {
  const ModalPlayerRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Aguarde'),
      content: Text('O robô está fazendo uma jogada...'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
