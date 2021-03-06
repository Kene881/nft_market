// ignore_for_file: deprecated_member_use
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nftapp/providers/cards.dart';
import 'package:nftapp/screens/editor_screen.dart';
import 'package:nftapp/widgets/card_item.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Welcome! This is your Card Collection!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(EditorScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Icon(
                      UniconsLine.plus_circle,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Add your own cards",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: CARDS_DATA
                  .map(
                    (cardData) => CardItem(
                      id: cardData.id,
                      title: cardData.title,
                      image: cardData.image,
                      damage: cardData.damage,
                      manaCost: cardData.manaCost,
                      health: cardData.health,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
