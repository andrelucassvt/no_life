import 'package:bonfire/bonfire.dart';
import 'package:no_life/game/sprites/crianca_player.dart';

class CriancaPlayerController extends StateController<CriancaPlayer> {
  @override
  void update(double dt, CriancaPlayer component) {}

  void mostrarMensagemDaCartaInicial() {
    component?.mostrarMensagemDaCartaInicial();
  }

  void mostrarMensagemQuemSouEuInicial() {
    component?.mostrarMensagemQuemSouEuInicial();
  }

  void lerPrimeiroContatoGatoSalaDanca() {
    component?.lerPrimeiroContatoGatoSalaDanca();
  }

  void falaDoGatoSalaTresPortas() {
    component?.falaDoGatoSalaTresPortas();
  }

  void atacar(JoystickActionEvent event) {
    if (event.id == PlayerAttackCrianca.perto) {
      component?.execAttack(20);
    }
  }
}
