import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:no_life/util/audio/main_menu_audio.dart';

class GameInject {
  static void init() {
    final getIt = GetIt.instance;
    getIt.registerFactory<AudioPlayer>(() => AudioPlayer());
    getIt.registerSingleton(MainMenuAudio(audioPlayer: getIt()));
  }
}
