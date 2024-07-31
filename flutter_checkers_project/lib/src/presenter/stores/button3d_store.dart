import 'package:flutter/material.dart';

class ButtonStore {
  final GestureTapCallback onPressed;
  final Widget child;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final ShadowDegree shadowDegree;
  final int duration;
  final BoxShape shape;
  double position;

  ButtonStore({
    required this.onPressed,
    required this.child,
    this.enabled = true,
    this.color = const Color.fromARGB(255, 212, 212, 212),
    required this.height,
    this.shadowDegree = ShadowDegree.light,
    required this.width,
    this.duration = 70,
    this.shape = BoxShape.rectangle,
    this.position = 4,
  });

  void press() {
    position = 0;
  }

  void release() {
    position = 4;
  }

  Color darken(Color color, ShadowDegree degree) {
    double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

enum ShadowDegree { light, dark }