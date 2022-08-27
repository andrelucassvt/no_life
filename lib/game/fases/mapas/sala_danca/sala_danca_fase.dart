import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/fases/mapas/corredor/corredor_fase.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/audio_assets.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class SalaDancaFase extends StatefulWidget {
  const SalaDancaFase({Key? key}) : super(key: key);

  @override
  State<SalaDancaFase> createState() => _SalaDancaFaseState();
}

class _SalaDancaFaseState extends State<SalaDancaFase> {
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
  final controller = BonfireInjector.instance.get<CriancaPlayerController>();
  @override
  void initState() {
    super.initState();
    audioMenu.playMainMenuMusic(AudioAssets.salaDeDanca);
    audioMenu.audioPlayer.onPlayerComplete.listen((event) {
      audioMenu.playMainMenuMusic(AudioAssets.salaDeDanca);
    });
  }

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
            map: TiledWorldMap('map/sala_danca/sala_danca.json',
                forceTileSize: const Size(12, 12))
              ..registerObject(
                  'corredor',
                  (p) => ExitMapSensor(
                      'corredor', p.position, p.size, (v) => _acaoSensor(v)))
              ..registerObject(
                  'cartaGato',
                  (p) => ExitMapSensor(
                      'cartaGato', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(
                Vector2((4 * tamanhoMapaGlobal), (5 * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'corredor') {
      audioMenu.stopMainMenuMusic();
      DefaultNavigator.nevagarParaOutrosMapas(context, const CorredorFase());
    } else if (value == 'cartaGato') {
      controller.mostrarCartaGato();
    }
  }
}