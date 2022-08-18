import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Btn extends StatelessWidget {
  Color? color;
  Color? labelColor;
  String label;
  Function? onclick;
  double? opacity;
  double? roundness;
  double padding;
  Btn(this.label,
      {Key? key,
      this.color,
      this.onclick,
      this.opacity,
      this.labelColor,
      this.roundness,
      this.padding = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(roundness ?? 12),
      //using color as the default
      color: color != null
          ? color?.withOpacity(opacity ?? 1)
          : Theme.of(context).primaryColor.withOpacity(opacity ?? 1),
      child: InkWell(
        onTap: () {
          onclick != null ? onclick!() : "";
        },
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Label(
            label,
            size: 16,
            weight: FontWeight.bold,
            align: TextAlign.center,
            color: labelColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
