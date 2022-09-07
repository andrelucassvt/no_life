import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/fases/mapas/corredor/corredor_fase.dart';
import 'package:no_life/game/fases/mapas/quarto/sensor/contato_carta.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/audio_assets.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/navigator/default_navigator.dart';

class QuartoFase extends StatefulWidget {
  const QuartoFase(
      {Key? key,
      this.mostrarMensagemQuemSouEuInicial = true,
      this.vetorX,
      this.vetorY})
      : super(key: key);

  final bool mostrarMensagemQuemSouEuInicial;
  final double? vetorX;
  final double? vetorY;

  @override
  State<QuartoFase> createState() => _QuartoFaseState();
}

class _QuartoFaseState extends State<QuartoFase> {
  final controller = BonfireInjector.instance.get<CriancaPlayerController>();
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
  @override
  void initState() {
    super.initState();
    audioMenu.playMainMenuMusic(AudioAssets.ambienteCasa);
    Future.delayed(const Duration(seconds: 2), () {
      if (widget.mostrarMensagemQuemSouEuInicial) {
        controller.mostrarMensagemQuemSouEuInicial();
      }
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
            map: TiledWorldMap('map/quarto/quarto.json',
                forceTileSize: const Size(16, 16))
              ..registerObject(
                  'cartaAviso',
                  (p) => ContatoQuartoSensor('cartaAviso', p.position, p.size,
                      (v) => _acaoSensorQuarto(v)))
              ..registerObject(
                  'saida',
                  (p) => ContatoQuartoSensor('saida', p.position, p.size,
                      (v) => _acaoSensorQuarto(v))),
            player: CriancaPlayer(Vector2(
                ((widget.vetorX ?? 2) * tamanhoMapaGlobal),
                ((widget.vetorY ?? 5) * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensorQuarto(String value) {
    if (value == 'cartaAviso') {
      controller.lerMensagemDaCartaInicial();
    } else if (value == 'saida') {
      DefaultNavigator.nevagarParaOutrosMapas(context, const CorredorFase());
    }
  }
}
