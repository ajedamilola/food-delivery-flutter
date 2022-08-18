import 'package:flutter/material.dart';

class Vspace extends StatelessWidget {
  final double? size;
  const Vspace({Key? key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
class Hspace extends StatelessWidget {
  final double? size;
  const Hspace({Key? key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
