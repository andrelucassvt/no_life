import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/knight_idle.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/knight_run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}

class CriancaPlayer extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        UseStateController<CriancaPlayerController> {
  CriancaPlayer(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(50),
          speed: 200,
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width * 1.5,
        color: Colors.transparent,
      ),
    );
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(30, 20), align: Vector2(12, 25))
    ]));
  }

  void mostrarCartaGato() {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Parece que tem outra carta ao lado do ',
                ),
                const TextSpan(
                    text: 'GATO', style: TextStyle(color: Colors.red)),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: '"Olá humano, me chamo malus, o gato."',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text:
                      '"Me perdoe por não me apresentar logo quando nos vimos"',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text:
                      '"Sei que tudo pode está confuso para você sobre esse lugar e as folhas"',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: '"Estarei esperando você na sala a frente"',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
          ],
          onClose: () {
            if (!isDead) {
              gameRef.camera.moveToPlayerAnimated(zoom: 1);
            }
          },
          onFinish: () {},
        );
      },
    );
  }

  void mostrarMensagemQuemSouEuInicial() {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Oque está acontecendo ?\n',
                ),
                const TextSpan(
                  text: 'Que lugar é esse ?',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
          ],
          onClose: () {
            if (!isDead) {
              gameRef.camera.moveToPlayerAnimated(zoom: 1);
            }
          },
          onFinish: () {},
        );
      },
    );
  }

  void mostrarMensagemDaCartaInicial() {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Oque é isso?!\n',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: 'É uma carta!!!\nOque será que está escrito ?\n',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(
                  text:
                      '"Para descobrir quem ou oque é você. É preciso encontrar 5 folhas de um diario perdido" ',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text:
                      '**Colete todas as 5 folhas e você tera a sua resposta**',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
          ],
          onClose: () {
            if (!isDead) {
              gameRef.camera.moveToPlayerAnimated(zoom: 1);
            }
          },
          onFinish: () {},
        );
      },
    );
  }
}
