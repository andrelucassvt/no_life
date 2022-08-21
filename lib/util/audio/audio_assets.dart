class AudioAssets {
  static String caminhoAudioTheme(String audio) {
    return 'music/theme/$audio.mp3';
  }

  static String get temaPrincipal => caminhoAudioTheme('tema_principal');
}
