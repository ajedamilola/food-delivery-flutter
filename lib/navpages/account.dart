import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/fadeIn.dart';
import 'package:food_delivery_app/widgets/spacing.dart';
import 'package:food_delivery_app/widgets/text.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Info(title, value) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              title.toString(),
              color: Colors.black54,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: value.toString(),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ))),
            )
          ],
        ),
      );
    }

    return FadeIn(
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    Hspace(size: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(
                          "John Doe",
                          size: 22,
                        ),
                        Label(
                          "johnny@gmail.com",
                          color: Colors.black54,
                        )
                      ],
                    ),
                    Hspace(size: 20),
                    ElevatedButton(
                      onPressed: (() {}),
                      child: Label("Edit Info"),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      "Billing Information",
                      size: 25,
                    ),
                    Vspace(size: 10),
                    Info("Address Line 1", "14, Jhonny Dane Street, Nigeria"),
                    Info("Address Line 2", "Earth, Milky way Galaxy"),
                    Info("Phone Number", "+234 - 09819921"),
                    Divider(
                      height: 20,
                    ),
                    Label(
                      "Other Information",
                      size: 25,
                    ),
                    Vspace(size: 10),
                    Info("Best Food", "Everything"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
