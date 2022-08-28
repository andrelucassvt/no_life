import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/audio_assets.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';

class CaminhoLavaFases extends StatefulWidget {
  const CaminhoLavaFases({Key? key}) : super(key: key);

  @override
  State<CaminhoLavaFases> createState() => _CaminhoLavaFasesState();
}

class _CaminhoLavaFasesState extends State<CaminhoLavaFases> {
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
  final controller = BonfireInjector.instance.get<CriancaPlayerController>();

  @override
  void initState() {
    super.initState();
    audioMenu.playMainMenuMusic(AudioAssets.salaCaminhoLava);
  }

  int faseIniticialIndex = 1;

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
              actions: [
                JoystickAction(
                  actionId: PlayerAttackCrianca.perto,
                  sprite: Sprite.load('joystick_atack.png'),
                  align: JoystickActionAlign.BOTTOM_RIGHT,
                  size: 80,
                  margin: const EdgeInsets.only(bottom: 50, right: 50),
                ),
              ],
            ),
            progress: Container(color: Colors.black),
            map: TiledWorldMap(
                'map/sala_tres_portas/portas/caminhoLava/caminho_lava_$faseIniticialIndex.json',
                forceTileSize: const Size(16, 16))
              ..registerObject(
                  'lava',
                  (p) => ExitMapSensor(
                      'lava', p.position, p.size, (v) => _acaoSensor(v))),
            player: CriancaPlayer(
                Vector2(((4) * tamanhoMapaGlobal), ((5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'lava') {}
  }
}
