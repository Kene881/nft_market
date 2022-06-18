// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

import 'card_model.dart';

// ignore: constant_identifier_names
final CARDS_DATA = [
  CardPl(
    id: "i1",
    title: "Ice Small",
    image: "assets/images/IceSmall.png",
    manaCost: "1",
    damage: "1",
    health: "2",
  ),
  CardPl(
    id: "i2",
    title: "Ice Middle",
    image: "assets/images/IceMiddle.png",
    manaCost: "2",
    damage: "3",
    health: "2",
  ),
  CardPl(
    id: "i3",
    title: "Ice Big",
    image: "assets/images/IceBig.png",
    manaCost: "3",
    damage: "5",
    health: "3",
  ),
  CardPl(
    id: "i4",
    title: "Shield",
    image: "assets/images/IceShield.png",
    manaCost: "3",
    damage: "0",
    health: "0",
  ),
  CardPl(
    id: "i5",
    title: "Freeze",
    image: "assets/images/IceFreeze.png",
    manaCost: "4",
    damage: "0",
    health: "0",
  ),
  CardPl(
    id: "f1",
    title: "Hot Big",
    image: "assets/images/HotBig.png",
    manaCost: "4",
    damage: "5",
    health: "5",
  ),
  CardPl(
    id: "f2",
    title: "Hot Small",
    image: "assets/images/HotSmall2.png",
    manaCost: "1",
    damage: "1",
    health: "2",
  ),
  CardPl(
    id: "f3",
    title: "Hot Mid",
    image: "assets/images/HotMid.png",
    manaCost: "2",
    damage: "3",
    health: "2",
  ),
  CardPl(
    id: "f4",
    title: "FireBall",
    image: "assets/images/HotFireBall.png",
    manaCost: "6",
    damage: "10",
    health: "0",
  ),
  CardPl(
    id: "f5",
    title: "Melt",
    image: "assets/images/HotMelt.png",
    manaCost: "4",
    damage: "0",
    health: "0",
  ),
];

// ignore: constant_identifier_names
const NFT_CARDS_DATA = [
  NFTCardPl(
      id: "n1",
      title: "Warrior Girl",
      image: "assets/images/WarriorGirl.png",
      descrip: "Ability: damage is done to both neighbor cards, if there are any. HEEy guys, buy this InCrEdiBLe CArD!!",
      manaCost: "5",
      damage: "10",
      health: "12",
      cost: "3 ETH"),
];
