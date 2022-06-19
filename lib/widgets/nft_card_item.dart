// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expandable/expandable.dart';
import 'package:nftapp/providers/card_model.dart';
import 'package:nftapp/providers/cards.dart';
import 'package:nftapp/widgets/card_item.dart';

class CardItemNFTNFT extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final String manaCost;
  final String damage;
  final String health;
  final String descrip;
  final String cost;

  CardItemNFTNFT({
    required this.id,
    required this.title,
    required this.image,
    required this.manaCost,
    required this.damage,
    required this.health,
    required this.descrip,
    required this.cost,
  });

  @override
  State<CardItemNFTNFT> createState() => _CardItemNFTState();
}

class _CardItemNFTState extends State<CardItemNFTNFT>
    with TickerProviderStateMixin {
  void selectCard(BuildContext context) {
    // _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCard(context),
      child: ExpandableNotifier(
        child: Expandable(
          collapsed: ExpandableButton(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Card(
                  color: Colors.black,
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.asset(
                              widget.image,
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              color: Colors.black54,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          expanded: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 5),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name: ${widget.title}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Mana cost: ${widget.manaCost}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Health: ${widget.health}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Damage: ${widget.damage}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.descrip,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          final newCard = CardPl(
                              id: widget.id,
                              title: widget.title,
                              image: widget.image,
                              manaCost: widget.manaCost,
                              damage: widget.damage,
                              health: widget.health);
                          setState(() {
                            CARDS_DATA.add(newCard);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 5),
                          ),
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ExpandableButton(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 5),
                          ),
                          child: const Text(
                            "Close",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
