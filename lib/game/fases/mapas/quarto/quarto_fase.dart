import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/fases/mapas/corredor/corredor_fase.dart';
import 'package:no_life/game/fases/mapas/quarto/sensor/contato_carta.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/navigator/default_navigator.dart';

class QuartoFase extends StatefulWidget {
  const QuartoFase({Key? key}) : super(key: key);

  @override
  State<QuartoFase> createState() => _QuartoFaseState();
}

class _QuartoFaseState extends State<QuartoFase> {
  final controller = BonfireInjector.instance.get<CriancaPlayerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: const Icon(Icons.abc),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // ),
      body: LayoutBuilder(builder: (context, constraints) {
        tamanhoMapaGlobal =
            max(constraints.maxHeight, constraints.maxWidth) / 22;
        return BonfireTiledWidget(
            //showCollisionArea: true,
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
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
            player: CriancaPlayer(
                Vector2((2 * tamanhoMapaGlobal), (5 * tamanhoMapaGlobal))));
      }),
    );
  }

  void _acaoSensorQuarto(String value) {
    if (value == 'cartaAviso') {
      controller.mostrarMensagemDaCartaInicial();
    } else if (value == 'saida') {
      DefaultNavigator.nevagarParaOutrosMapas(context, const CorredorFase());
    }
  }
}
