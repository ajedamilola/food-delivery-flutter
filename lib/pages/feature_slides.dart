// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class FeaturesSlide extends StatefulWidget {
  const FeaturesSlide({Key? key}) : super(key: key);

  @override
  State<FeaturesSlide> createState() => _FeaturesSlideState();
}

class _FeaturesSlideState extends State<FeaturesSlide> {
  int currentIndex = 0;
  //custom widgets
  Widget logo = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset("images/logo.png", width: 69, height: 50),
      Label(
        "Kupa",
        weight: FontWeight.bold,
      )
    ],
  );

  Widget SlideItem(String? image, String text, String description) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100,
          backgroundImage: AssetImage(image.toString()),
        ),
        Vspace(size: 30),
        Label(
          text,
          weight: FontWeight.w800,
          size: 27,
          align: TextAlign.center,
        ),
        Vspace(size: 15),
        Label(
          description,
          color: Colors.black45,
          align: TextAlign.center,
        )
      ],
    );
  }

  Widget Dot([int index = 0]) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
          borderRadius: BorderRadius.circular(45)),
    );
  }

  //data
  List<Slide> slides = [
    Slide(
        image: "images/food1.png",
        text: "All Your Favourite Foods",
        description: "Order your favourite menu, with easy on-demand delivery"),
    Slide(
        image: "images/delivery.png",
        text: "Get Delivery At Your Doorstep",
        description:
            "Your Ready order will be delivered quickly by our courier"),
  ];

  //build
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            logo,
            //slider
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: 400,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    //updating the current index
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: controller,
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    Slide slide = slides[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child:
                          SlideItem(slide.image, slide.text, slide.description),
                    );
                    // return Label(slide.text);
                  },
                ),
              ),
            ),
            //row of animated dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Dot(), Hspace(size: 10), Dot(1)],
            ),
            Vspace(size: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //varrying buttons
                  (currentIndex == slides.length - 1
                      ? Btn(
                          "Get Started",
                          onclick: () {
                            Navigator.of(context).pushNamed("/auth/new");
                          },
                        )
                      : Btn(
                          "Continue",
                          onclick: () {
                            controller.jumpToPage(1);
                          },
                        )),
                  Vspace(size: 5),
                  Btn(
                    "Sign In",
                    opacity: .3,
                    labelColor: Theme.of(context).primaryColor,
                    onclick: () {
                      Navigator.of(context).pushNamed("/auth");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Slide {
  final String? image;
  final String text;
  final String description;
  Slide({this.image, this.text = "", this.description = ""});
}
