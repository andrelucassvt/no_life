import 'package:bonfire/bonfire.dart';
import 'package:no_life/game/sprites/crianca_player.dart';

class CriancaPlayerController extends StateController<CriancaPlayer> {
  @override
  void update(double dt, CriancaPlayer component) {}

  void lerMensagemDaCartaInicial() {
    component?.lerMensagemDaCartaInicial();
  }

  void mostrarMensagemQuemSouEuInicial() {
    component?.mostrarMensagemQuemSouEuInicial();
  }

  void lerPrimeiroContatoGatoSalaDanca() {
    component?.lerPrimeiroContatoGatoSalaDanca();
  }

  void lerfalaDoGatoSalaTresPortas() {
    component?.lerfalaDoGatoSalaTresPortas();
  }

  void lerMensagemSepulturaDicaEnigma() {
    component?.lerMensagemSepulturaDicaEnigma();
  }
}
