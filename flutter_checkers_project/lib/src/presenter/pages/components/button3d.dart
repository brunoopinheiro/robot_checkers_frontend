import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/presenter/stores/button3d_store.dart';

class AnimatedButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Widget child;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final ShadowDegree shadowDegree;
  final int duration;
  final BoxShape shape;

  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.enabled = true,
    this.color = const Color.fromARGB(255, 212, 212, 212),
    required this.height,
    this.shadowDegree = ShadowDegree.light,
    required this.width,
    this.duration = 70,
    this.shape = BoxShape.rectangle,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - _shadowHeight;

    return GestureDetector(
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
      child: SizedBox(
        width: widget.width,
        height: _height + _shadowHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled
                      ? darken(widget.color, widget.shadowDegree)
                      : darken(Colors.grey, widget.shadowDegree),
                  borderRadius: widget.shape != BoxShape.circle
                      ? const BorderRadius.all(Radius.circular(16))
                      : null,
                  shape: widget.shape,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: _curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: _position,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled ? widget.color : Colors.grey,
                  borderRadius: widget.shape != BoxShape.circle
                      ? const BorderRadius.all(Radius.circular(16))
                      : null,
                  shape: widget.shape,
                ),
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//store
  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 4;
    });
    widget.onPressed();
  }

  Color darken(Color color, ShadowDegree degree) {
    double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

