import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';

enum PlayerAttackCrianca { longe, perto }

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/crianca_idle.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/crianca_run.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
        "player/atack_effect_bottom.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
        "player/atack_effect_top.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        "player/atack_effect_left.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "player/atack_effect_right.png",
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

////////////////
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

  @override
  void joystickAction(JoystickActionEvent event) {
    if (hasController) {
      controller.atacar(event);
    }
    super.joystickAction(event);
  }

  void execAttack(double attack) {
    simpleAttackMelee(
      damage: attack,
      animationDown: PlayerSpriteSheet.attackBottom,
      animationLeft: PlayerSpriteSheet.attackLeft,
      animationRight: PlayerSpriteSheet.attackRight,
      animationUp: PlayerSpriteSheet.attackTop,
      size: Vector2.all(tamanhoMapaGlobal),
    );
  }

  /// Falas do personagem  e CARTA do gato //////
  void lerPrimeiroContatoGatoSalaDanca() {
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

  void falaDoGatoSalaTresPortas() {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                    text: 'Gato malus\n', style: TextStyle(color: Colors.red)),
                const TextSpan(
                  text:
                      '"Aqui começa sua jornada por 3 folhas do diário perdido que estão nas portas a sua frente"',
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
                    text: '"Cada porta é um reino e um desafio diferente"'),
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
                  text: '"Porta',
                ),
                const TextSpan(
                    text: ' vermelha:\n"', style: TextStyle(color: Colors.red)),
                const TextSpan(
                  text: '"Nessa porta se encontra o desafio chamado',
                ),
                const TextSpan(
                    text: ' Caminho da Lava"',
                    style: TextStyle(color: Colors.red)),
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
                      '"Passe por todos os caminhos e recupere a folha do diário"',
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
                      '------ A DESCRIÇÃO DAS OUTRAS PORTAS NÃO ESTÃO DISPONIVELS NESSE BETA -----',
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
