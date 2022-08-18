import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  const Label(this.text,
      {Key? key, this.color, this.size, this.weight, this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}
