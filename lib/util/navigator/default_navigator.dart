import 'package:flutter/material.dart';

class DefaultNavigator {
  static Future<void> nevagarParaOutrosMapas(
      BuildContext context, Widget mundo) async {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => mundo,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Container(
            color: Colors.black,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}
