import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/players_testes.dart';
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
      body: Stack(
        children: [
          BonfireTiledWidget(
              joystick: Joystick(
                directional: JoystickDirectional(),
              ), // required
              map: TiledWorldMap('tile/mapa_aberto.json',
                  forceTileSize: const Size(32, 32)),
              player: Kinght(Vector2(40, 40))),
          const BarraDeCimaFasesWidget()
        ],
      ),
    );
  }
}
