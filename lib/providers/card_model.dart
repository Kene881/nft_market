import 'package:flutter/foundation.dart';

class CardPl {
  final String id;
  final String title;
  final String image;
  final String manaCost;
  final String damage;
  final String health;

  const CardPl({
    required this.id,
    required this.title,
    required this.image,
    required this.manaCost,
    required this.damage,
    required this.health,
  });
}

class NFTCardPl {
  final String id;
  final String title;
  final String image;
  final String descrip;
  final String manaCost;
  final String damage;
  final String health;
  final String cost;

  const NFTCardPl({
    required this.id,
    required this.title,
    required this.image,
    required this.descrip,
    required this.manaCost,
    required this.damage,
    required this.health,
    required this.cost,
  });
}