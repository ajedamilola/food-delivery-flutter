import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/appbar.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  InputDecoration decoration = InputDecoration(
      // fillColor: Colors.g,
      border: InputBorder.none,
      filled: true);
  @override
  Widget build(BuildContext context) {
    var primary = Theme.of(context).primaryColor;
    List<Widget> items = [
      Label(
        "Sign Up",
        weight: FontWeight.bold,
        size: 30,
      ),
      Label(
        "Create new account and choose favourite menu",
        color: Colors.black38,
      ),

      //username input
      Vspace(size: 25),
      Label("username"),
      Vspace(size: 5),
      TextField(
        decoration: decoration,
      ),

      //eamil input
      Vspace(size: 20),
      Label("Email"),
      Vspace(size: 5),
      TextField(
        decoration: decoration,
      ),

      //password input
      Vspace(size: 20),
      Label("Password"),
      Vspace(size: 5),
      TextField(
        obscureText: true,
        decoration: decoration,
      ),

      Vspace(size: 20), //default
      Btn(
        "Register",
        onclick: () {
          Navigator.of(context).pushNamed("/auth/verify");
        },
      ),
      Vspace(size: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(
            "Have an account?",
            size: 15,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/auth");
            },
            child: Label(
              "Login",
              size: 15,
              weight: FontWeight.w700,
              color: primary,
            ),
          ),
        ],
      ),
      Vspace(size: MediaQuery.of(context).size.height * 0.12),
      Label(
        "By clicking Register, you agree to our",
        align: TextAlign.center,
        color: Colors.black54,
      ),
      Label(
        "Terms and Data Policy",
        align: TextAlign.center,
        color: primary,
      ),
    ];

    return Scaffold(
      appBar: M_Appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            }),
      ),
    );
  }
}
