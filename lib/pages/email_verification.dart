import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/appbar.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget NumberBox([int? value]) {
      return TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          letterSpacing: 30,
        ),
        maxLength: 4,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: M_Appbar(),
      body: Center(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Column(
            children: [
              Label(
                "Verification Email",
                size: 30,
                weight: FontWeight.w600,
                align: TextAlign.center,
              ),
              Vspace(size: 20),
              Label(
                "Please Enter the code we just sent to the email",
                color: Colors.black45,
                align: TextAlign.center,
              ),
              Label(
                "demo@gmail.com",
                size: 15.5,
                weight: FontWeight.w600,
              ),
              Vspace(size: 30),
              NumberBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Label(
                    "If you didnt recieve a code?",
                    size: 15,
                  ),
                  Label(
                    "Resend",
                    color: Theme.of(context).primaryColor,
                    weight: FontWeight.w600,
                    size: 16,
                  ),
                ],
              ),
              Vspace(size: 40),
              Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Btn(
                    "Continue",
                    onclick: () {
                      Navigator.of(context).popAndPushNamed("/auth/congrats");
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
