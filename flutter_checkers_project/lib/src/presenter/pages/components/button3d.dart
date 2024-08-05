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
  late final ButtonStore buttonStore;

  @override
  void initState() {
    super.initState();
    buttonStore = ButtonStore(
      onPressed: widget.onPressed,
      child: widget.child,
      enabled: widget.enabled,
      color: widget.color,
      height: widget.height,
      shadowDegree: widget.shadowDegree,
      width: widget.width,
      duration: widget.duration,
      shape: widget.shape,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - 4;

    return GestureDetector(
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
      child: SizedBox(
        width: widget.width,
        height: _height + 4,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: buttonStore.getShadowColor(),
                  borderRadius: widget.shape != BoxShape.circle
                      ? const BorderRadius.all(Radius.circular(16))
                      : null,
                  shape: widget.shape,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: widget.duration),
              bottom: buttonStore.position,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: buttonStore.getButtonColor(),
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

  void _pressed(_) {
    setState(() {
      buttonStore.press();
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      buttonStore.release();
    });
  }
}
