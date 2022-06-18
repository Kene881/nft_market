// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nftapp/screens/editor_screen.dart';
import 'package:nftapp/widgets/card_item.dart';
import 'package:nftapp/widgets/nft_card_item.dart';
import 'package:unicons/unicons.dart';
import '../providers/cards.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1 / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Welcome! This is the marketplace!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              children: NFT_CARDS_DATA
                  .map(
                    (cardData) => CardItemNFTNFT(
                      id: cardData.id,
                      title: cardData.title,
                      image: cardData.image,
                      damage: cardData.damage,
                      manaCost: cardData.manaCost,
                      health: cardData.health,
                      cost: cardData.cost,
                      descrip: cardData.descrip,
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
