import 'dart:async';

import 'package:flame_audio/flame_audio.dart';

class MainAudioGameApp {
  Future<void> playMainMenuMusic(String nameMusic) async {
    await FlameAudio.bgm.play(nameMusic, volume: .70);
  }

  Future<void> stopMainMenuMusic() async {
    await FlameAudio.bgm.stop();
  }
}
