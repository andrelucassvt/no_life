import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class SensorObjectCollision extends GameDecoration with Sensor {
  final String id;
  final ValueChanged<String> onChange;

  SensorObjectCollision(this.id, Vector2 position, Vector2 size, this.onChange)
      : super(
          position: position,
          size: size,
        );

  @override
  void onContact(collision) {
    if (collision is ObjectCollision && collision is! Player) {
      onChange(id);
    }
  }
}
