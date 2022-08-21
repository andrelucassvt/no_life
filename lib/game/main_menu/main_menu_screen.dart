import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:no_life/game/fases/primeiro_mundo_screen.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';
import 'package:no_life/util/main_menu_assets/main_menu_assets.dart';
import 'package:no_life/util/main_menu_assets/main_menu_strings.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen>
    with TickerProviderStateMixin {
  final audioMenu = GetIt.I.get<MainMenuAudio>();
  late final AnimationController _controllerPressioneAqui = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animationPressioneAqui = CurvedAnimation(
    parent: _controllerPressioneAqui,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    audioMenu.playMainMenuMusic();
    audioMenu.audioPlayer.onPlayerComplete.listen((event) {
      audioMenu.playMainMenuMusic();
    });
  }

  @override
  void dispose() {
    _controllerPressioneAqui.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: Lottie.asset(MainMenuAssets.waterMainMenu)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    MainMenuStrings.nomeGame,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                FadeTransition(
                  opacity: _animationPressioneAqui,
                  child: GestureDetector(
                    onTap: () {
                      audioMenu.stopMainMenuMusic();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const PrimeiroMundoScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          MainMenuStrings.pressioneAqui,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.play_circle,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
