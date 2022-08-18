import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.cube_box_fill,
                color: Colors.amber,
                size: 60,
              ),
              Vspace(size: 30),
              Label(
                "Congratulations!",
                size: 28,
                weight: FontWeight.w700,
              ),
              Vspace(size: 10),
              Label(
                "Your account has been verified, please enjoy our menu",
                align: TextAlign.center,
                color: Colors.black38,
              ),
              Vspace(size: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Btn(
                  "Get Started",
                  onclick: () {
                    Navigator.of(context).popAndPushNamed("/main");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
