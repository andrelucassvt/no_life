import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/fases/mundo_esquerdo_1.dart';
import 'package:no_life/game/sprites/crianca_player.dart';
import 'package:no_life/util/sensor/exit_map_sensor.dart';
import 'package:no_life/util/widgets/barra_de_cima_fases.dart';

class PrimeiroMundoScreen extends StatefulWidget {
  const PrimeiroMundoScreen({Key? key}) : super(key: key);

  @override
  State<PrimeiroMundoScreen> createState() => _PrimeiroMundoScreenState();
}

class _PrimeiroMundoScreenState extends State<PrimeiroMundoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       icon: const Icon(Icons.abc)),
      // ),
      body: Stack(
        children: [
          BonfireTiledWidget(
              joystick: Joystick(
                directional: JoystickDirectional(),
              ), // required
              map: TiledWorldMap('tile/mundo_sonhos.json',
                  forceTileSize: const Size(16, 16))
                ..registerObject(
                    'sensorLeft',
                    (p) => ExitMapSensor('sensorLeft', p.position, p.size,
                        (v) => _exitMap(v, context))),
              player: CriancaPlayer(Vector2(150, 540))),
          const BarraDeCimaFasesWidget()
        ],
      ),
    );
  }

  void _exitMap(String value, BuildContext context) {
    if (value == 'sensorLeft') {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MundoEsquerdo1Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Container(
              color: Colors.black,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
        (Route<dynamic> route) => false,
      );
    }
  }
}
