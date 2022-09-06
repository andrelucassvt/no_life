import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class FolhaSepulturaFase extends StatefulWidget {
  const FolhaSepulturaFase({Key? key}) : super(key: key);

  @override
  State<FolhaSepulturaFase> createState() => _FolhaSepulturaFaseState();
}

class _FolhaSepulturaFaseState extends State<FolhaSepulturaFase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        tamanhoMapaGlobal =
            max(constraints.maxHeight, constraints.maxWidth) / 22;
        return BonfireTiledWidget(
            showCollisionArea: showCollisionArea,
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            progress: Container(color: Colors.black),
            //lightingColorGame: Colors.black.withOpacity(0.7), // required
            map: TiledWorldMap(
              'map/sala_tres_portas/portas/caminho_sepulturas/folha_sepultura.json',
              forceTileSize: const Size(12, 12),
            )..registerObject(
                'folha',
                (p) => SensorObject(
                    'folha', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(Vector2(
                ((8) * tamanhoMapaGlobal), ((13) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {}
}
