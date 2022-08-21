import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Colors.redAccent[100],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 5)),
      child: const Text(
        'Play',
        style: TextStyle(
            fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
