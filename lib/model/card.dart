import 'dart:ui';
import 'package:flutter/foundation.dart';

class CardItem {
  final int id;
  final int score;
  final Color color;

  CardItem({@required this.id, @required this.score, @required this.color});

  CardItem copyWithObject(CardItem item) {
    return CardItem(
        id: item.id ?? this.id,
        score: item.score ?? this.id,
        color: item.color ?? this.color);
  }

  CardItem copyWith(int id, int score, Color color) {
    return CardItem(
        id: id ?? this.id, score: score ?? this.id, color: color ?? this.color);
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || this.id == other.id;

  @override
  int get hashCode => id;
}
