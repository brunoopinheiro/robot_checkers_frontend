import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  final Color color;
  final double size;
  final void Function()? onTap;

  const Piece({
    super.key,
    required this.color,
    required this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
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
            child: Container(
              width: size - 10,
              height: size - 10,
              decoration: BoxDecoration(
                color: color,
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
          ),
        ),
      ),
    );
  }
}