import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/appbar.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:cupertino_icons/cupertino_icons.dart' as cp;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  InputDecoration decoration = InputDecoration(
      // fillColor: Colors.g,
      border: InputBorder.none,
      filled: true);
  @override
  Widget build(BuildContext context) {
    var primary = Theme.of(context).primaryColor;
    List<Widget> items = [
      Row(
        children: [
          Label(
            "Welcome Back",
            weight: FontWeight.bold,
            size: 30,
          ),
          Icon(
            CommunityMaterialIcons.hand_okay,
            color: Colors.amber,
            size: 30,
          )
        ],
      ),
      Label(
        "Sign Into Your Account",
        color: Colors.black38,
      ),

      //username input
      Vspace(size: 25),
      Label("Email"),
      Vspace(size: 5),
      TextField(
        decoration: decoration,
      ),

      //password input
      Vspace(size: 15),
      Label("Password"),
      Vspace(size: 5),
      TextField(
        obscureText: true,
        decoration: decoration,
      ),
      Vspace(size: 10),
      Label(
        "Forgot Password?",
        weight: FontWeight.w600,
        color: primary,
      ),
      Vspace(size: 20), //default
      Btn(
        "Login",
        onclick: () {
          Navigator.of(context).pushNamed("/main");
        },
      ) //custom
      ,
      Vspace(size: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(
            "Dont have an account?",
            size: 15,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/auth/new");
            },
            child: Label(
              "Sign up",
              size: 15,
              weight: FontWeight.w700,
              color: primary,
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Label(
                "Or With",
                color: Colors.grey,
                align: TextAlign.center,
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
      ),
      ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(CommunityMaterialIcons.google),
        label: Label("Sign in with Google"),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(15),
          ),
          side: MaterialStateProperty.all(BorderSide(color: Colors.black26)),
          foregroundColor: MaterialStateProperty.all(Colors.black87),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
      Vspace(size: 6),
      ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(CommunityMaterialIcons.apple),
        label: Label("Sign in with Apple"),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(15),
          ),
          side: MaterialStateProperty.all(BorderSide(color: Colors.black26)),
          foregroundColor: MaterialStateProperty.all(Colors.black87),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    ];
    return Scaffold(
      appBar: M_Appbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) => items[index]),
        ),
      ),
    );
  }
}
