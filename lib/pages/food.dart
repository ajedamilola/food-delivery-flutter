import 'package:community_material_icon/community_material_icon.dart';
import "package:flutter/material.dart";
import 'package:food_delivery_app/widgets/appbar.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

List<Map<String, dynamic>> addtionals = [
  {"name": "Coca Cola", "price": 200, "wanted": false},
  {"name": "Sprite", "price": 200, "wanted": false},
  {"name": "Big Cola", "price": 200, "wanted": false},
  {"name": "Bigi Orange", "price": 200, "wanted": false},
];

class FoodPage extends StatefulWidget {
  FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  double totalPrice = 0;

  PurchaseAmount foodPriceSelector = PurchaseAmount(
    price: 50,
  );

  @override
  Widget build(BuildContext context) {
    //calculating the price
    void calculatePrice() {
      totalPrice = 0;
      for (var item in addtionals) {
        totalPrice += item["wanted"] ? item["price"] : 0;
      }
      setState(() {
        totalPrice += foodPriceSelector.price;
      });
    }

    // foodPriceSelector.calculateFunction = calculatePrice;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment(0, -1),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("images/food4.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.5),
            ),
            child: Image.asset("images/logo.png", width: 200),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.68,
              minChildSize: 0.68,
              builder: (context, controller) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                  child: Center(
                    child: ListView(
                      children: [
                        Icon(Icons.horizontal_rule_rounded, size: 50),
                        Hero(
                          tag: "main_image",
                          child: Image.asset(
                            "images/food5.jpg",
                            width: 200,
                          ),
                        ),
                        Vspace(size: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              "Long Food Name",
                              weight: FontWeight.bold,
                              size: 25,
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                        Label(
                          "category",
                          size: 15,
                          color: Colors.grey,
                        ),
                        Vspace(size: 10),
                        foodPriceSelector,
                        Divider(
                          height: 20,
                        ),
                        Label(
                          "Additional Dessert",
                          weight: FontWeight.bold,
                          size: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: addtionals.length,
                            itemBuilder: (_, index) => AdditionalItem(
                              name: addtionals[index]["name"] as String,
                              price: addtionals[index]["price"] as num,
                            ),
                          ),
                        ),
                        Btn(
                          "Make Purchase ($totalPrice)",
                          onclick: () {
                            print("object");
                          },
                        )
                      ],
                      controller: controller,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class PurchaseAmount extends StatefulWidget {
  var price;
  int amount = 0;
  PurchaseAmount({
    Key? key,
    this.price,
  }) : super(key: key);

  @override
  State<PurchaseAmount> createState() => _PurchaseAmountState();
}

class _PurchaseAmountState extends State<PurchaseAmount> {
  num totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.amount > 1
                ? setState(() {
                    widget.amount--;
                    totalPrice = widget.amount * widget.price;
                  })
                : null;
          },
          icon: Icon(
            CommunityMaterialIcons.minus_circle,
            color: widget.amount > 1
                ? Theme.of(context).primaryColor
                : Colors.grey,
            size: 25,
          ),
        ),
        Label(
          widget.amount.toString(),
          size: 22,
          weight: FontWeight.bold,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.amount++;
              totalPrice = widget.amount * widget.price;
            });
          },
          icon: Icon(
            CommunityMaterialIcons.plus_circle,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
        ),
        Hspace(size: 10),
        Label(
          "\$$totalPrice",
          color: Theme.of(context).primaryColor,
          size: 20,
        )
      ],
    );
  }
}

class AdditionalItem extends StatefulWidget {
  num price;
  String name;
  AdditionalItem({Key? key, required this.price, required this.name})
      : super(key: key);

  @override
  State<AdditionalItem> createState() => _AdditionalItemState();
}

class _AdditionalItemState extends State<AdditionalItem> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.name),
        subtitle: Text("\$${widget.price}"),
        trailing: Checkbox(
          onChanged: (newVal) {
            setState(() {
              checked = newVal as bool;
            });
          },
          value: checked,
        ));
  }
}
