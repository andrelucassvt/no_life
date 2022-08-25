import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/main.dart';

class CorredorFase extends StatefulWidget {
  const CorredorFase({Key? key}) : super(key: key);

  @override
  State<CorredorFase> createState() => _CorredorFaseState();
}

class _CorredorFaseState extends State<CorredorFase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        tamanhoMapaGlobal =
            max(constraints.maxHeight, constraints.maxWidth) / 22;
        return BonfireTiledWidget(
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            //lightingColorGame: Colors.black.withOpacity(0.7), // required
            map: TiledWorldMap('map/corredor/corredor.json',
                forceTileSize: const Size(12, 12)),
            player: CriancaPlayer(
                Vector2((4 * tamanhoMapaGlobal), (5 * tamanhoMapaGlobal))));
      }),
    );
  }
}
