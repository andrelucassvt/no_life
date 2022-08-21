import 'package:audioplayers/audioplayers.dart';
import 'package:no_life/util/audio/audio_assets.dart';

class MainMenuAudio {
  final AudioPlayer audioPlayer;
  MainMenuAudio({
    required this.audioPlayer,
  });
  Future<void> playMainMenuMusic() async {
    await audioPlayer.play(AssetSource(AudioAssets.temaPrincipal));
  }

  Future<void> stopMainMenuMusic() async {
    await audioPlayer.pause();
  }
}
