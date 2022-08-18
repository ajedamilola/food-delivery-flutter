import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  Widget child;
  int? duration;
  FadeIn(this.child, {Key? key, this.duration}) : super(key: key);

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 5), () {
      setState(() {
        opacity = 1;
      });
    });
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: widget.duration ?? 300),
      child: widget.child,
    );
  }
}
