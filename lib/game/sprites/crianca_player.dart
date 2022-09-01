import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/cartas_mensagens.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';

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

  /// Falas do personagem  e CARTA do gato //////
  void lerPrimeiroContatoGatoSalaDanca() {
    CartasMensagens.lerPrimeiroContatoGatoSalaDanca(gameRef);
  }

  void lerfalaDoGatoSalaTresPortas() {
    CartasMensagens.lerfalaDoGatoSalaTresPortas(gameRef);
  }

  void lerMensagemDaCartaInicial() {
    CartasMensagens.lerMensagemDaCartaInicial(gameRef);
  }

  void lerMensagemSepulturaDicaEnigma() {
    CartasMensagens.lerMensagemSepulturaDicaEnigma(gameRef);
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
}
