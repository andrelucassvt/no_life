import 'dart:async';

import 'package:bonfire/bonfire.dart';

class ObjectSepulturasSpriteSheet {
  static Future<Sprite> get sepultura1 => Sprite.load('sepultura_1.png');
  static Future<Sprite> get sepultura2 => Sprite.load('sepultura_2.png');
  static Future<Sprite> get sepultura3 => Sprite.load('sepultura_3.png');
}

class SepulturaObject extends GameDecoration
    with DragGesture, ObjectCollision, Movement, Pushable {
  String valueName;
  SepulturaObject(
      {required Vector2 position,
      required Future<Sprite> sprite,
      required this.valueName})
      : super.withSprite(
            sprite: sprite, position: position, size: Vector2.all(50)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(50),
          ),
        ],
      ),
    );
  }
}
