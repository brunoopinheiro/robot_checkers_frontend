import 'package:flutter/material.dart';

class StaticBoard extends StatelessWidget {
  const StaticBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          final int row = index ~/ 8;
          final int column = index % 8;
          final bool isEvenRow = row % 2 == 0;
          final bool isEvenColumn = column % 2 == 0;
          final Color squareColor =
              (isEvenRow == isEvenColumn) ? Colors.purple : Colors.green;

          return Container(
            decoration: BoxDecoration(
              color: squareColor,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
        },
        itemCount: 64,
      ),
    );
  }
}
