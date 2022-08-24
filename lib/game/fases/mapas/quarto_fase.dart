import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:no_life/game/sprites/crianca_player.dart';

class QuartoFase extends StatefulWidget {
  const QuartoFase({Key? key}) : super(key: key);

  @override
  State<QuartoFase> createState() => _QuartoFaseState();
}

class _QuartoFaseState extends State<QuartoFase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: BonfireTiledWidget(
          showCollisionArea: true,
          joystick: Joystick(
            directional: JoystickDirectional(),
          ), // required
          map: TiledWorldMap('map/quarto/quarto.json',
              forceTileSize: const Size(16, 16)),
          player: CriancaPlayer(Vector2(50, 156))),
    );
  }
}
