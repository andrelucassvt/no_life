class AudioAssets {
  static String caminhoAudioTheme(String audio) {
    return 'theme/$audio.mp3';
  }

  static String caminhoAudioCopy(String audio) {
    return 'copy/$audio.mp3';
  }

  static String get temaPrincipal => caminhoAudioTheme('tema_principal');

  static String get salaDeDanca => caminhoAudioCopy('chopin');

  static String get salaCaminhoLava => caminhoAudioTheme('caminhoLavaTheme');
}
