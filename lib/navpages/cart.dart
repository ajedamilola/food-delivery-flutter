import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      Center(
        child: Label("Cart"),
      ),
    );
  }
}
