import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/portas/sala_enigma_sepulturas/sensor/sensor_sepultura.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/sala_tres_portas_fase.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/game/sprites/porta/porta_controller.dart';
import 'package:no_life/game/sprites/porta/porta_object.dart';
import 'package:no_life/game/sprites/sepultura/sepultura_object.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class SalaEnigmaSepulturas extends StatefulWidget {
  const SalaEnigmaSepulturas({Key? key}) : super(key: key);

  @override
  State<SalaEnigmaSepulturas> createState() => _SalaEnigmaSepulturasState();
}

class _SalaEnigmaSepulturasState extends State<SalaEnigmaSepulturas> {
  final playerController =
      BonfireInjector.instance.get<CriancaPlayerController>();
  final portaController = BonfireInjector.instance.get<PortaController>();
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => portaController.abrirPorta()),
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
                      valueName: '1',
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura1),
                  '2': (properties) => SepulturaObject(
                      valueName: '2',
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura2),
                  '3': (properties) => SepulturaObject(
                      valueName: '3',
                      position: properties.position,
                      sprite: ObjectSepulturasSpriteSheet.sepultura3),
                  'porta': (properties) => PortaObject(
                      position: properties.position,
                      sprite: ObjectPortaSpriteSheet.portaFechada),
                })
              ..registerObject(
                  'carta',
                  (p) => ExitMapSensor(
                      'carta', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  's1',
                  (p) =>
                      SensorSepulturaCollision('s1', p.position, p.size, (v) {
                        setState(() {
                          s1 = v;
                        });
                        _acaoSensorVerificarSepulturasCertas();
                      }))
              ..registerObject(
                  's2',
                  (p) =>
                      SensorSepulturaCollision('s2', p.position, p.size, (v) {
                        setState(() {
                          s2 = v;
                        });
                        _acaoSensorVerificarSepulturasCertas();
                      }))
              ..registerObject(
                  's3',
                  (p) =>
                      SensorSepulturaCollision('s3', p.position, p.size, (v) {
                        setState(() {
                          s3 = v;
                        });
                        _acaoSensorVerificarSepulturasCertas();
                      }))
              ..registerObject(
                  'sair',
                  (p) => ExitMapSensor(
                      'sair', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(
                Vector2(((4) * tamanhoMapaGlobal), ((5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'sair') {
      DefaultNavigator.nevagarParaOutrosMapas(
          context, const SalaTresPortasFase());
    }
  }

  void _acaoSensorVerificarSepulturasCertas() {
    if (s1 && s2 && s3) {
      portaController.abrirPorta();
    }
  }
}
