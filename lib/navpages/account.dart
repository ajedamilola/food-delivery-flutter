import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      Center(
        child: Label("Account Page"),
      ),
    );
  }
}
