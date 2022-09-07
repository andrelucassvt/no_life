import 'package:flutter/material.dart';
import 'package:no_life/game/main_menu/main_menu_screen.dart';
import 'package:no_life/util/navigator/default_navigator.dart';

class BetaObrigado extends StatefulWidget {
  const BetaObrigado({Key? key}) : super(key: key);

  @override
  State<BetaObrigado> createState() => _BetaObrigadoState();
}

class _BetaObrigadoState extends State<BetaObrigado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Obrigado por testar o Beta de No Life :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: InkWell(
              onTap: () {
                DefaultNavigator.nevagarParaOutrosMapas(
                    context, const MainMenuScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white)),
                child: const Text(
                  'Voltar pra home',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
