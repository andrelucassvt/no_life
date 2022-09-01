import 'package:bonfire/bonfire.dart';
import 'package:no_life/game/sprites/porta/porta_object.dart';

class PortaController extends StateController<PortaObject> {
  @override
  void update(double dt, PortaObject component) {}

  void abrirPorta() {
    component?.abrirPorta();
  }
}
