import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/sepultura/sepultura_object.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class SalaEnigmaSepulturas extends StatefulWidget {
  const SalaEnigmaSepulturas({Key? key}) : super(key: key);

  @override
  State<SalaEnigmaSepulturas> createState() => _SalaEnigmaSepulturasState();
}

class _SalaEnigmaSepulturasState extends State<SalaEnigmaSepulturas> {
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
                'map/sala_tres_portas/portas/caminho_sepulturas/caminho_sepulturas.json',
                forceTileSize: const Size(12, 12),
                objectsBuilder: {
                  '1': (properties) => SepulturaObject(
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura1),
                  '2': (properties) => SepulturaObject(
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura2),
                  '3': (properties) => SepulturaObject(
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura3),
                })
              ..registerObject(
                  'carta',
                  (p) => ExitMapSensor(
                      'carta', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'sair',
                  (p) => ExitMapSensor(
                      'sair', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(
                Vector2(((4) * tamanhoMapaGlobal), ((5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {}
}
