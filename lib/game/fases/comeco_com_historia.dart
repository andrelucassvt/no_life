import 'package:flutter/material.dart';
import 'package:no_life/game/fases/primeiro_mundo_screen.dart';

class ComecoComHistoria extends StatefulWidget {
  const ComecoComHistoria({Key? key}) : super(key: key);

  @override
  State<ComecoComHistoria> createState() => _ComecoComHistoriaState();
}

class _ComecoComHistoriaState extends State<ComecoComHistoria>
    with TickerProviderStateMixin {
  late final AnimationController _controllerFrases = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animationFrases = CurvedAnimation(
    parent: _controllerFrases,
    curve: Curves.easeIn,
  );

  List<String> listaFrases = [
    '',
    'testesaasassasas',
    'aaaaaaaaaaaaaaaaaaaa',
    'bbbbbbbbbbbbbbbbbbbb',
    'cccccccccccccccccccc'
  ];
  int _indexInicialFrases = 0;

  @override
  void initState() {
    super.initState();
    mudarFrases();
  }

  @override
  void dispose() {
    _controllerFrases.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeTransition(
              opacity: _animationFrases,
              child: Text(
                listaFrases[_indexInicialFrases],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void mudarFrases() async {
    _controllerFrases.forward();
    await Future<void>.delayed(const Duration(seconds: 4), () {
      if (_indexInicialFrases > 3) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const PrimeiroMundoScreen()));
      }
      if (_indexInicialFrases <= 3) {
        setState(() {
          _indexInicialFrases++;
        });
        _controllerFrases.reset();
        mudarFrases();
      }
    });
  }
}
