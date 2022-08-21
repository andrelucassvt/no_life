import 'package:flutter/material.dart';
import 'package:no_life/game/main_menu/main_menu_screen.dart';
import 'package:no_life/util/splash_assets/splash_assets.dart';
import 'package:no_life/util/splash_assets/splash_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool mudarLogoInicial = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 2), () {
      _mudarLogo();
    });
  }

  _mudarLogo() {
    setState(() {
      mudarLogoInicial = true;
    });
    Future<void>.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainMenuScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedCrossFade(
                firstChild: _firstChild(),
                secondChild: _secondChild(),
                crossFadeState: !mudarLogoInicial
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 1000)),
          ),
        ],
      ),
    );
  }

  Widget _firstChild() {
    return SizedBox(
      height: 300,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Developer:',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'André Salvador',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _secondChild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            SplashAssets.logoFone,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          SplashStrings.paraUmaMelhorExperiencia,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}
