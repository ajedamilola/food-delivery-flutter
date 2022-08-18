import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/navpages/account.dart';
import 'package:food_delivery_app/navpages/cart.dart';
import 'package:food_delivery_app/navpages/home.dart';
import 'package:food_delivery_app/navpages/menu.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    const pages = [
      {"name": "Home", "widget": NavHome()},
      {"name": "Menu", "widget": Menu()},
      {"name": "Cart", "widget": Cart()},
      {"name": "Account", "widget": Account()}
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(pages[tabIndex]["name"] as String),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment(0, 0),
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
              Positioned(
                top: 15,
                right: 5,
                width: 10,
                height: 10,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: pages[tabIndex]["widget"] as Widget,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: tabIndex,
        onTap: (int i) {
          setState(() {
            tabIndex = i;
          });
        },
        items: [
          BottomBarItem(
              icon: Icon(Icons.home_rounded),
              activeColor: primary,
              title: Label("Home")),
          BottomBarItem(
              icon: Icon(Icons.list_rounded),
              activeColor: primary,
              title: Label("Menu")),
          BottomBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              activeColor: primary,
              title: Label("Cart")),
          BottomBarItem(
              icon: Icon(Icons.person_rounded),
              activeColor: primary,
              title: Label("Account")),
        ],
      ),
    );
  }
}
