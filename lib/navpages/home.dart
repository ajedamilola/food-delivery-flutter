import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class NavHome extends StatelessWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    //the search
    TextField Search = TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        contentPadding: EdgeInsets.all(10),
        filled: true,
        prefixIcon: Icon(Icons.search),
        labelText: "Search On Kupa",
      ),
    );

    //delivery stack
    Stack DeliveryStack = Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    "Delivery To Home",
                    color: Colors.white,
                    size: 20,
                  ),
                  Label(
                    "Netrix Solutions, Ikeja",
                    color: Colors.white.withOpacity(0.9),
                    size: 14,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Label(
                      "2.5KM",
                      color: primary,
                    ),
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
        )
      ],
    );

    //discount row
    Container DiscountRow = Container(
      decoration: BoxDecoration(
        color: primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(
                "Ewa ati Breadi",
                size: 22,
                weight: FontWeight.w600,
              ),
              Label("Discount 25%"),
              Vspace(size: 14),
              Btn(
                "Order Now",
                padding: 14,
              )
            ],
          ),
          Image.asset(
            "images/food5.webp",
            width: 125,
          )
        ],
      ),
    );

    Column FoodItem(dynamic name, dynamic price, dynamic image) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 150,
          ),
          Label(
            name,
            size: 16,
          ),
          Label(
            price,
            color: primary,
            weight: FontWeight.w600,
          )
        ],
      );
    }

    const foods = [
      {"name": "Larroti", "price": r"$215", "image": "images/food1.png"},
      {"name": "Bongolli", "price": r"$200", "image": "images/food2.jfif"},
      {"name": "Motcha", "price": r"$125", "image": "images/food3.jpg"},
      {"name": "Cusange", "price": r"$450", "image": "images/food4.jpg"},
      {"name": "Morionni", "price": r"$300", "image": "images/food5.jpg"},
      {"name": "Ciggeretti", "price": r"$27", "image": "images/food6.jpg"},
    ];

    var elements = [
      Search,
      Vspace(size: 20),
      DeliveryStack,
      Vspace(size: 10),
      DiscountRow,
      Vspace(size: 15),
      Label(
        "Top of the week",
        weight: FontWeight.bold,
        size: 20,
      ),
      Container(
        padding: EdgeInsets.only(top: 8),
        height: 200,
        width: MediaQuery.of(context).size.width - 20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              Map<String, String> currentFood = foods[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FoodItem(currentFood["name"], currentFood["price"],
                    currentFood["image"]),
              );
            }),
      )
    ];

    return FadeIn(
      SizedBox(
          child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (context, index) => elements[index])),
      duration: 300,
    );
  }
}
