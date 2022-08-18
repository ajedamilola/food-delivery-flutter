import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 4,
        ), () {
      Navigator.of(context).popAndPushNamed("/features");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment(0, 0),
            children: [
              Image.asset(
                "images/logo.png",
                width: 100,
                height: 100,
              ),
              const Positioned(
                height: 80,
                top: 125,
                child: Label(
                  "Kupa",
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
