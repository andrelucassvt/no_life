import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/fases/mapas/sala_danca/sala_danca_fase.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/portas/sala_enigma_sepulturas/sala_enigma_sepulturas.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class SalaTresPortasFase extends StatefulWidget {
  const SalaTresPortasFase({Key? key, this.vector2}) : super(key: key);
  final Vector2? vector2;
  @override
  State<SalaTresPortasFase> createState() => _SalaTresPortasFaseState();
}

class _SalaTresPortasFaseState extends State<SalaTresPortasFase> {
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
  final controller = BonfireInjector.instance.get<CriancaPlayerController>();

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
              'map/sala_tres_portas/sala_tres_portas.json',
              forceTileSize: const Size(12, 12),
            )
              ..registerObject(
                  'gato',
                  (p) => SensorObject(
                      'gato', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'salaDanca',
                  (p) => SensorObject(
                      'salaDanca', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'caminhoSepulturas',
                  (p) => SensorObject('caminhoSepulturas', p.position, p.size,
                      (v) => _acaoSensor(v)))
              ..registerObject(
                  '_',
                  (p) => SensorObject(
                      '_', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  '_',
                  (p) => SensorObject(
                      '_', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(Vector2(
                ((widget.vector2?.x ?? 4) * tamanhoMapaGlobal),
                ((widget.vector2?.y ?? 5) * tamanhoMapaGlobal))));
      }),
    );
  }

  Future<void> _acaoSensor(String value) async {
    if (value == 'gato') {
      controller.lerfalaDoGatoSalaTresPortas();
    } else if (value == 'salaDanca') {
      DefaultNavigator.nevagarParaOutrosMapas(
          context,
          const SalaDancaFase(
            vetorX: 13,
            vetorY: 13,
          ));
    } else if (value == 'caminhoSepulturas') {
      //await audioMenu.stopMainMenuMusic();
      DefaultNavigator.nevagarParaOutrosMapas(
          context, const SalaEnigmaSepulturas());
    }
  }
}
