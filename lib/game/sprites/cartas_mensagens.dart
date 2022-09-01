import 'package:bonfire/base/bonfire_game_interface.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';

class CartasMensagens {
  static void lerPrimeiroContatoGatoSalaDanca(BonfireGameInterface gameRef) {
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
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
        );
      },
    );
  }

  static void lerfalaDoGatoSalaTresPortas(BonfireGameInterface gameRef) {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                    text: 'Gato malus:\n', style: TextStyle(color: Colors.red)),
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
                    text: '"Cada porta contém enigmas para serem resolvidos"'),
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
                        '"Resolva os anigmas e tenha uma folha perdida como recompensa"'),
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
                    text: '"Seja livre para escolher por onde começar"'),
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
                      '------ APENAS A PORTA VERMELHA ESTÁ DISPONIVEL NESSE BETA -----',
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
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
        );
      },
    );
  }

  static void lerMensagemDaCartaInicial(BonfireGameInterface gameRef) {
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
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
        );
      },
    );
  }

  static void lerMensagemSepulturaDicaEnigma(BonfireGameInterface gameRef) {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text:
                      '"A resposta desse enigma está escondida em um dos comodos dessa casa"',
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
                  text: '"Abuse da sua nova habilidade para achar a dica"',
                  style: TextStyle(color: Colors.blue),
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
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
        );
      },
    );
  }
}
