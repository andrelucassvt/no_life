import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/util/widgets/barra_de_cima_fases.dart';

class MundoEsquerdo1Screen extends StatefulWidget {
  const MundoEsquerdo1Screen({Key? key}) : super(key: key);

  @override
  State<MundoEsquerdo1Screen> createState() => _MundoEsquerdo1ScreenState();
}

class _MundoEsquerdo1ScreenState extends State<MundoEsquerdo1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       icon: const Icon(Icons.abc)),
      // ),
      body: Stack(
        children: [
          BonfireTiledWidget(
              joystick: Joystick(
                directional: JoystickDirectional(),
              ), // required
              map: TiledWorldMap('tile/mundo_esquerdo_1.json',
                  forceTileSize: const Size(16, 16)),
              player: CriancaPlayer(Vector2(150, 540))),
          const BarraDeCimaFasesWidget()
        ],
      ),
    );
  }
}
