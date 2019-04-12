import 'dart:ui';

import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final int score;
  final Color color;

  Item({@required this.id, @required this.score, @required this.color});

  Item copyWith(Item item) {
    return Item(
        id: item.id ?? this.id,
        score: item.score ?? this.id,
        color: item.color ?? this.color);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Item &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              score == other.score &&
              color == other.color;

  @override
  int get hashCode =>
      id.hashCode ^
      score.hashCode ^
      color.hashCode;


}
