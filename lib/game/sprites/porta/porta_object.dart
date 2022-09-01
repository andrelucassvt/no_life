import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:no_life/game/sprites/porta/porta_controller.dart';

class ObjectPortaSpriteSheet {
  static Future<Sprite> get portaAberta => Sprite.load('porta_aberta.png');
  static Future<Sprite> get portaFechada => Sprite.load('porta_fechada.png');
}

class PortaObject extends GameDecoration
    with ObjectCollision, UseStateController<PortaController> {
  PortaObject({
    required FutureOr<Sprite> sprite,
    required Vector2 position,
  }) : super.withSprite(
            sprite: sprite, position: position, size: Vector2.all(115)) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2.all(115)),
        ],
      ),
    );
  }

  void abrirPorta() {
    removeFromParent();
  }
}
