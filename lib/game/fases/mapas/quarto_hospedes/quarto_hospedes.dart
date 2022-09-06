import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/fases/mapas/corredor/corredor_fase.dart';
import 'package:no_life/game/sprites/cama/cama_object.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';
import 'package:no_life/util/widgets/aviso_dica_widget.dart';

class QuartoHospedes extends StatefulWidget {
  const QuartoHospedes({Key? key}) : super(key: key);

  @override
  State<QuartoHospedes> createState() => _QuartoHospedesState();
}

class _QuartoHospedesState extends State<QuartoHospedes> {
  bool mostrarDica = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            tamanhoMapaGlobal =
                max(constraints.maxHeight, constraints.maxWidth) / 22;
            return BonfireTiledWidget(
              showCollisionArea: showCollisionArea,
              joystick: Joystick(
                directional: JoystickDirectional(),
              ),
              progress: Container(color: Colors.black),
              map: TiledWorldMap('map/quarto_hospedes/quarto_hospedes.json',
                  forceTileSize: const Size(12, 12),
                  objectsBuilder: {
                    'cama': (properties) =>
                        CamaObject(position: properties.position)
                  })
                ..registerObject(
                    'sair',
                    (p) => SensorObject(
                        'sair', p.position, p.size, (v) => _acaoSensor(v)))
                ..registerObject(
                    'dica',
                    (p) => SensorObject(
                        'dica', p.position, p.size, (v) => _acaoSensor(v))),
              player: CriancaPlayer(Vector2(
                  ((4) * tamanhoMapaGlobal), ((12) * tamanhoMapaGlobal))),
            );
          }),
          if (mostrarDica)
            AvisoDicaWidget(
              onTap: () {
                setState(() {
                  mostrarDica = false;
                });
              },
            )
        ],
      ),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'sair') {
      DefaultNavigator.nevagarParaOutrosMapas(
          context,
          CorredorFase(
            vector2: Vector2(27, 5),
          ));
    }
    if (value == 'dica') {
      setState(() {
        mostrarDica = true;
      });
    }
  }
}
