import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/sepultura/sepultura_object.dart';

class SensorSepulturaCollision extends GameDecoration with Sensor {
  final String id;
  final ValueChanged<bool> onChange;

  SensorSepulturaCollision(
      this.id, Vector2 position, Vector2 size, this.onChange)
      : super(
          position: position,
          size: size,
        );

  @override
  void onContact(collision) {
    if (collision is SepulturaObject) {
      if (collision.valueName == '1' && id == 's1') {
        onChange(true);
      }
      if (collision.valueName == '2' && id == 's2') {
        onChange(true);
      }
      if (collision.valueName == '3' && id == 's3') {
        onChange(true);
      }
    }
  }
}
