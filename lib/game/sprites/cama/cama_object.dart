import 'dart:async';

import 'package:bonfire/bonfire.dart';

class ObjectCamaSpriteSheet {
  static Future<Sprite> get cama => Sprite.load('cama.png');
}

class CamaObject extends GameDecoration
    with DragGesture, ObjectCollision, Movement, Pushable {
  CamaObject({
    required Vector2 position,
  }) : super.withSprite(
            sprite: ObjectCamaSpriteSheet.cama,
            position: position,
            size: Vector2(110, 200)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(110, 200),
          ),
        ],
      ),
    );
  }
}
