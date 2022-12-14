import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/portas/sala_enigma_sepulturas/folha_sepultura.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/portas/sala_enigma_sepulturas/sensor/sensor_sepultura.dart';
import 'package:no_life/game/fases/mapas/sala_tres_portas/sala_tres_portas_fase.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/game/sprites/porta/porta_controller.dart';
import 'package:no_life/game/sprites/porta/porta_object.dart';
import 'package:no_life/game/sprites/sepultura/sepultura_object.dart';
import 'package:no_life/main.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/navigator/default_navigator.dart';
import 'package:no_life/util/sensor/sensor_object.dart';
import 'package:no_life/util/widgets/aviso_tela_widget.dart';

class SalaEnigmaSepulturas extends StatefulWidget {
  const SalaEnigmaSepulturas({Key? key}) : super(key: key);

  @override
  State<SalaEnigmaSepulturas> createState() => _SalaEnigmaSepulturasState();
}

class _SalaEnigmaSepulturasState extends State<SalaEnigmaSepulturas> {
  final audioMenu = GetIt.I.get<MainAudioGameApp>();
  final playerController =
      BonfireInjector.instance.get<CriancaPlayerController>();
  final portaController = BonfireInjector.instance.get<PortaController>();
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;

  bool mostrarMensagemDeMacanica = true;

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
                      (p) => SensorObject(
                          'carta', p.position, p.size, (v) => _acaoSensor(v)))
                  ..registerObject(
                      's1',
                      (p) => SensorSepulturaCollision('s1', p.position, p.size,
                              (v) {
                            setState(() {
                              s1 = v;
                            });
                            _acaoSensorVerificarSepulturasCertas();
                          }))
                  ..registerObject(
                      's2',
                      (p) => SensorSepulturaCollision('s2', p.position, p.size,
                              (v) {
                            setState(() {
                              s2 = v;
                            });
                            _acaoSensorVerificarSepulturasCertas();
                          }))
                  ..registerObject(
                      's3',
                      (p) => SensorSepulturaCollision('s3', p.position, p.size,
                              (v) {
                            setState(() {
                              s3 = v;
                            });
                            _acaoSensorVerificarSepulturasCertas();
                          }))
                  ..registerObject(
                      'sair',
                      (p) => SensorObject(
                          'sair', p.position, p.size, (v) => _acaoSensor(v)))
                  ..registerObject(
                      'carta',
                      (p) => SensorObject(
                          'carta', p.position, p.size, (v) => _acaoSensor(v)))
                  ..registerObject(
                      'buscarFolha',
                      (p) => SensorObject('buscarFolha', p.position, p.size,
                          (v) => _acaoSensor(v))),
                player: CriancaPlayer(Vector2(
                    ((15) * tamanhoMapaGlobal), ((13) * tamanhoMapaGlobal))));
          }),
          if (mostrarMensagemDeMacanica)
            AvisoTelaWidget(
              onTap: () {
                setState(() {
                  mostrarMensagemDeMacanica = false;
                });
              },
              image: 'assets/images/interacao.gif',
              title: 'Nova mec??nica',
              subtitle:
                  'Alguns objetos s??o possiveis de serem arrastados com toque na tela',
            )
        ],
      ),
    );
  }

  void _acaoSensor(String value) {
    if (value == 'sair') {
      DefaultNavigator.nevagarParaOutrosMapas(
          context,
          SalaTresPortasFase(
            vector2: Vector2(12, 6),
          ));
    } else if (value == 'buscarFolha') {
      audioMenu.stopMainMenuMusic();
      DefaultNavigator.nevagarParaOutrosMapas(
          context, const FolhaSepulturaFase());
    } else if (value == 'carta') {
      playerController.lerMensagemSepulturaDicaEnigma();
    }
  }

  void _acaoSensorVerificarSepulturasCertas() {
    if (s1 && s2 && s3) {
      portaController.abrirPorta();
    }
  }
}
