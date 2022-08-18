import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double opacity = 0;
  @override
  void initState() {
    // TODO: implement initState
    opacity = 0;
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      Center(
        child: Label("Menu"),
      ),
    );
  }
}
