import 'package:audioplayers/audioplayers.dart';
import 'package:bonfire/bonfire.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/game/sprites/crianca_player_controller.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';

class GameInject {
  static void init() {
    final getIt = GetIt.instance;
    getIt.registerFactory<AudioPlayer>(() => AudioPlayer());
    BonfireInjector().put((i) => CriancaPlayerController());
    getIt.registerSingleton(MainAudioGameApp(audioPlayer: getIt()));
  }
}
