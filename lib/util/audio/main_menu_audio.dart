import 'dart:io';

import 'package:audioplayers/audioplayers.dart';

class MainAudioGameApp {
  final AudioPlayer audioPlayer;
  MainAudioGameApp({
    required this.audioPlayer,
  });
  Future<void> playMainMenuMusic(String nameMusic) async {
    if (Platform.isIOS) {
      await audioPlayer.play(AssetSource(nameMusic), volume: 70);
      return;
    }
    await audioPlayer.play(AssetSource(nameMusic));
  }

  Future<void> stopMainMenuMusic() async {
    await audioPlayer.stop();
  }
}
