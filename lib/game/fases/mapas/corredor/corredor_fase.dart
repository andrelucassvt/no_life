import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/fases/mapas/quarto/quarto_fase.dart';
import 'package:no_life/game/fases/mapas/quarto_hospedes/quarto_hospedes.dart';
import 'package:no_life/game/fases/mapas/sala_danca/sala_danca_fase.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/sensor_object.dart';

class CorredorFase extends StatefulWidget {
  const CorredorFase({Key? key, this.vector2}) : super(key: key);

  final Vector2? vector2;

  @override
  State<CorredorFase> createState() => _CorredorFaseState();
}

class _CorredorFaseState extends State<CorredorFase> {
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
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
                  (p) => SensorObject(
                      'quarto', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'quartoHospedes',
                  (p) => SensorObject('quartoHospedes', p.position, p.size,
                      (v) => _acaoSensor(v)))
              ..registerObject(
                  'irSalaDanca',
                  (p) => SensorObject('irSalaDanca', p.position, p.size,
                      (v) => _acaoSensor(v))),
            player: CriancaPlayer(Vector2(
                ((widget.vector2?.x ?? 4) * tamanhoMapaGlobal),
                ((widget.vector2?.y ?? 5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) async {
    if (value == 'quarto') {
      await audioMenu.stopMainMenuMusic();
      DefaultNavigator.nevagarParaOutrosMapas(
          context,
          const QuartoFase(
            mostrarMensagemQuemSouEuInicial: false,
            vetorX: 5,
            vetorY: 10,
          ));
    } else if (value == 'irSalaDanca') {
      await audioMenu.stopMainMenuMusic();
      DefaultNavigator.nevagarParaOutrosMapas(context, const SalaDancaFase());
    } else if (value == 'quartoHospedes') {
      DefaultNavigator.nevagarParaOutrosMapas(context, const QuartoHospedes());
    }
  }
}
