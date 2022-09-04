import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/fases/mapas/quarto/quarto_fase.dart';
import 'package:no_life/game/fases/mapas/quarto_hospedes/quarto_hospedes.dart';
import 'package:no_life/game/fases/mapas/sala_danca/sala_danca_fase.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class CorredorFase extends StatefulWidget {
  const CorredorFase({Key? key, this.vector2}) : super(key: key);

  final Vector2? vector2;

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
            showCollisionArea: showCollisionArea,
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            progress: Container(color: Colors.black),
            //lightingColorGame: Colors.black.withOpacity(0.7), // required
            map: TiledWorldMap('map/corredor/corredor.json',
                forceTileSize: const Size(12, 12))
              ..registerObject(
                  'quarto',
                  (p) => ExitMapSensor(
                      'quarto', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'quartoHospedes',
                  (p) => ExitMapSensor('quartoHospedes', p.position, p.size,
                      (v) => _acaoSensor(v)))
              ..registerObject(
                  'irSalaDanca',
                  (p) => ExitMapSensor('irSalaDanca', p.position, p.size,
                      (v) => _acaoSensor(v))),
            player: CriancaPlayer(Vector2(
                ((widget.vector2?.x ?? 4) * tamanhoMapaGlobal),
                ((widget.vector2?.y ?? 5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'quarto') {
      DefaultNavigator.nevagarParaOutrosMapas(
          context,
          const QuartoFase(
            mostrarMensagemQuemSouEuInicial: false,
            vetorX: 5,
            vetorY: 10,
          ));
    } else if (value == 'irSalaDanca') {
      DefaultNavigator.nevagarParaOutrosMapas(context, const SalaDancaFase());
    } else if (value == 'quartoHospedes') {
      DefaultNavigator.nevagarParaOutrosMapas(context, const QuartoHospedes());
    }
  }
}
