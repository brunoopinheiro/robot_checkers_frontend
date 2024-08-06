import 'package:flutter/material.dart';

class PieceStore {
  Color color;
  double size;
  void Function()? onTap;

  PieceStore({
    required this.color,
    required this.size,
    this.onTap,
  });

  void setColor(Color newColor) {
    color = newColor;
  }

  void setSize(double newSize) {
    size = newSize;
  }

  void setOnTap(void Function()? newOnTap) {
    onTap = newOnTap;
  }
}
