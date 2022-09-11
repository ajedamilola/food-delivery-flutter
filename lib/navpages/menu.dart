import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/food.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  double opacity = 0;
  GlobalKey _key = GlobalKey();
  UniqueKey _tabKey = UniqueKey();
  UniqueKey _tabPageKey = UniqueKey();
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
    TabController _tabController = TabController(length: 5, vsync: this);

    Color primary = Theme.of(context).primaryColor;

    Widget FoodItem(String name, dynamic price, String image) {
      return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => FoodPage())));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Hero(
                tag: "main_image",
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Label(
              name.toString(),
              size: 18,
              weight: FontWeight.w600,
            ),
            Label(
              "\$$price",
              size: 16,
              weight: FontWeight.w600,
              color: primary,
            ),
          ],
        ),
      );
    }

    //food date
    List<Map<String, dynamic>> foods = [
      {
        "name": "Semo and Afang",
        "price": 22.00,
        "image": "images/food6.jpg",
        "featured": false
      },
      {
        "name": "Rice and Stew",
        "price": 43.55,
        "image": "images/food3.jpg",
        "featured": true
      },
      {
        "name": "Afang and Fufu",
        "price": 24.34,
        "image": "images/food4.jpg",
        "featured": true
      },
      {
        "name": "Ogbono and Eba",
        "price": 12.53,
        "image": "images/food5.jpg",
        "featured": true
      },
      {
        "name": "Beans and Corn",
        "price": 25.22,
        "image": "images/food1.png",
        "featured": false
      },
      {
        "name": "Yam and Egg",
        "price": 12.45,
        "image": "images/food2.jfif",
        "featured": false
      },
    ];

    //food list building
    List<Widget> buildAll() {
      List<Widget> all = foods
          .map((food) => FoodItem(food["name"] as String,
              food["price"] as dynamic, food["image"] as String))
          .toList();
      return all;
    }

    List<Widget> buildFeatured() {
      //same as build all but the returned widgets has to have the "featured" key to be true
      List<Widget> all = [];
      for (Map<String, dynamic> food in foods) {
        //this is the point of filtering
        if (food["featured"]) {
          all.add(FoodItem(food["name"], food["price"], food["image"]));
        }
      }

      return all;
    }

    return FadeIn(
      Container(
        height: MediaQuery.of(context).size.height - 100,
        child: ListView(
          children: [
            Label(
              "Our food",
              color: Colors.grey,
            ),
            Vspace(size: 5),
            Label("Special For You",
                color: primary, size: 22, weight: FontWeight.bold),
            Vspace(size: 20),

            //search bar

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                contentPadding: EdgeInsets.all(10),
                filled: true,
                prefixIcon: Icon(Icons.search),
                labelText: "Search Your Menus",
              ),
            ),
            TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black87,
              indicatorColor: primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black26,
              tabs: [
                Tab(
                  child: Label("All"),
                ),
                Tab(
                  child: Label("Featured"),
                ),
                Tab(child: Label("Top of the week")),
                Tab(
                  child: Label("Sea Food"),
                ),
                Tab(
                  child: Label("Snacks"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: TabBarView(
                children: [
                  //tab page 1
                  SizedBox.expand(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      childAspectRatio: 1 / 1.5,
                      children: buildAll(),
                    ),
                  ),
                  SizedBox.expand(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      childAspectRatio: 1 / 1.5,
                      children: buildFeatured(),
                    ),
                  ),
                  SizedBox.expand(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      childAspectRatio: 1 / 1.5,
                      children: buildAll(),
                    ),
                  ),
                  SizedBox.expand(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      childAspectRatio: 1 / 1.5,
                      children: buildAll(),
                    ),
                  ),
                  SizedBox.expand(
                    child: GridView.count(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                      shrinkWrap: false,
                      childAspectRatio: 1 / 1.5,
                      children: buildAll(),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
