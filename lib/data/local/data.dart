import 'package:mobilechallenge/model/card.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'dart:async';

var cardItems = [
  new CardItem(
      id: 0,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 1,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 2,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 3,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 4,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 5,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 6,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 7,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 8,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
  new CardItem(
      id: 9,
      score: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0)),
];
