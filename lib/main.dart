import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_life/game/splash/splash_screen.dart';
import 'package:no_life/util/inject/game_inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();
  GameInject.init();
  runApp(const MyApp());
}

double tamanhoMapaGlobal = 32;
bool showCollisionArea = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return const MaterialApp(
      title: 'No life',
      home: SplashScreen(),
    );
  }
}
